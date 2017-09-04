/**
 * 
 */
package com.bonc.activity.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.bcel.classfile.Constant;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;

/**
 * <p>Title:HttpTest </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年7月6日 下午3:26:24*/
public class BatchInsertTest {
	
	public static final String URL = "";
	public static final String USER = "";
	public static final String PWD = "";
	public static final int COUNT = 100;
	public static final int BATCH_SIZE = 10;
	public static final String DATA = "12323";
	public static final int COMMIT_SIZE = 121;
	
	public static void main(String[] args) throws SQLException {
	
		Connection conn = DriverManager.getConnection(URL,USER,PWD);
		conn.setAutoCommit(false);
		PreparedStatement pstmt = conn.prepareStatement("insert into loadtest(id,data) values(?,?)");
		for(int i = 1;i  <= COUNT;i += BATCH_SIZE){
			pstmt.clearBatch();
			for(int j = 0;j < BATCH_SIZE;j ++){
				pstmt.setInt(1, i + j);
				pstmt.setString(2, DATA);
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			if((i + BATCH_SIZE - 1)%COMMIT_SIZE == 0){
				conn.commit();
			}
		}
	}
}
