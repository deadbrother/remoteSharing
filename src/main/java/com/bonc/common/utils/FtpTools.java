package com.bonc.common.utils;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FtpTools {
	private final static Logger log= LoggerFactory.getLogger(FtpTools.class);
	/*
	 * 连接FTP服务器
	 */
	private	static FTPClient		connectFtpServer(String SrvIp,String User,String Password,int Port){
		FTPClient ftpClient = null; //FTP 客户端代理
	    int reply; 
	    try { 
	    	ftpClient = new FTPClient(); 
	        ftpClient.setControlEncoding("UTF-8"); 
	        //ftpClient.configure(getFtpConfig()); 
	        if(Port >= 0)
	        	ftpClient.connect(SrvIp, Port);
	        else
	        	ftpClient.connect(SrvIp); 
	        ftpClient.login(User,Password); 
	        reply = ftpClient.getReplyCode(); 
	        if (!FTPReply.isPositiveCompletion(reply)) { 
	            ftpClient.disconnect(); 
	            log.error("FTP server refused connection."); 
	            log.error("FTP 服务拒绝连接！"); 
	            return null;
	         } 
	        int defaultTimeoutSecond=30*60 * 1000;  // --- 设置超时 1800秒（30分钟）---
            ftpClient.setDefaultTimeout(defaultTimeoutSecond);  
            ftpClient.setConnectTimeout(defaultTimeoutSecond );  
            ftpClient.setDataTimeout(defaultTimeoutSecond);  
	        log.info(" --- connect server sucess ---");
	    } catch (SocketException e) { 
	         e.printStackTrace(); 
	          log.error("登录ftp服务器 {} 失败,连接超时！",SrvIp); 
	          return null;
	    } catch (IOException e) { 
	          e.printStackTrace(); 
	           log.error("登录ftp服务器{} 失败，FTP服务器无法打开！",SrvIp); 
	           return null;
	    } 
		return ftpClient;
	}
	/*
	 * 退出FTP，退出FTP也可能抛异常，所以单独处理 
	 */
	private	static	void		disconnect(FTPClient ftpClient){
		try{
			ftpClient.logout(); 
    		ftpClient.disconnect(); 
		}catch(Exception e){
			
		}
		
	}
	/*
	 * 上传文件到FTP服务器
	 */
	public	static	int	upload(String SrvIp,String User,String Password,int Port,
			String RemoteFileName,String LocalFileName){
		FTPClient ftpClient = null; //FTP 客户端代理
		try{
			ftpClient = connectFtpServer(SrvIp,User,Password,Port);
			if(ftpClient == null){
				log.warn("连不上FTP服务器");
				return -1;
			}
			log.info("连上了FTP服务器");
			ftpClient.setFileType(FTP.BINARY_FILE_TYPE);// 设置传输二进制文件
              //ftpClient.enterLocalPassiveMode(); 
            ftpClient.setFileTransferMode(FTP.STREAM_TRANSFER_MODE); 
			// --- 是否自动创建远程路径 ? ---
            // ---得到远程目录 ---
            String		strRemotePath = getPath(RemoteFileName);
            if(strRemotePath != null){
            	ftpClient.enterLocalPassiveMode(); 
            	if(ftpClient.changeWorkingDirectory(strRemotePath) == false){   // --- 工作路径不存在 ---
            		// --- 创建路径 ---
            		ftpClient.enterLocalPassiveMode(); 
            		if(ftpClient.makeDirectory(strRemotePath) == false){
            			log.warn("--- create path:{} failed",strRemotePath);
            			disconnect(ftpClient);
            			return -1;
            		}
            		ftpClient.enterLocalPassiveMode(); 
            		if(ftpClient.changeWorkingDirectory(strRemotePath) == false){ 
            			log.warn("--- enter working  path:{} failed",strRemotePath);
            			disconnect(ftpClient);
            			return -1;
            		}
            	}
            }
			InputStream input = new FileInputStream(LocalFileName);
			ftpClient.enterLocalPassiveMode(); 
			boolean flag = ftpClient.storeFile(RemoteFileName, input); 
			if(flag){
				log.info("upload file :{} sucess ",RemoteFileName);
			}else{
				log.info("upload file :{} failed ",RemoteFileName);
				return -1;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return -1;
		}
		return 0;
	}
	/*
	 * 从FTP服务器得到数据，远程路径需要提前准备好，本地路径如不存在会自动创建
	 */
	public	static int	download(String SrvIp,String User,String Password,int Port,
			String RemoteFileName,String LocalFileName,boolean  deleteFileFlag){
		// --- 联接远程FTP ---
		FTPClient ftpClient = null; //FTP 客户端代理
		try{
			ftpClient = connectFtpServer(SrvIp,User,Password,Port);
			if(ftpClient == null){
				log.warn("连不上FTP服务器");
				return -1;
			}
			log.info("连上了FTP服务器");
			ftpClient.setFileType(FTP.BINARY_FILE_TYPE);// 设置传输二进制文件
			//ftpClient.enterLocalActiveMode();   //这句重要，不行换enterRemoteActiveMode 看看
			//ftpClient.enterRemotePassiveMode();
			//ftpClient.enterLocalPassiveMode();    // --- 经测试，联接UBUNTU LINUX 这个方法可用 ---
			//ftpClient.enterRemoteActiveMode(host, port)
			//ftpClient.enterRemoteActiveMode(InetAddress.getByName(SrvIp),21);   

			// --- 判断本地路径是否存在，不存在则创建 ---
			String		LocalPath = getPath(LocalFileName);
			if(LocalPath != null){
				File file = new File(LocalPath);  
				if( !file.exists() ){  
			       log.info("path:"+LocalPath +" not exist !!!");  
			       // --- 创建目录 ---
			       if(file.mkdirs()  == false) {
			           log.error("创建路径: {} 失败!!! " ,LocalPath);
			           disconnect(ftpClient);
			            return -1;
			       }
				}
				else{
					log.info("path:"+LocalPath +" already exist ");  
				}
			}
			log.info("开始提取文件");
			// --- 提取文件 ---
			 BufferedOutputStream buffOut = null; 
			 buffOut = new BufferedOutputStream(new FileOutputStream(LocalFileName)); 
			 ftpClient.enterLocalPassiveMode();
             if(ftpClient.retrieveFile(RemoteFileName, buffOut) == false){
            	 log.error("提取文件："+RemoteFileName +"失败!!");
            	 disconnect(ftpClient);
            	 return -1;
             }
             else{
            	 log.info(" --- sucess download remote file :{},local file : {} ",RemoteFileName,LocalFileName);
             }
			// --- 退出 ---
            buffOut.flush();
            buffOut.close();
            // --- 判断是否删除远程文件  ---
            if(deleteFileFlag){
            	// --- 删除失败也不管了 ，只要传输成功就行 -----------------
            	deleteRemoteFile(SrvIp,User,Password,Port,RemoteFileName);
            }
            disconnect(ftpClient);
			log.info("从FTP获取文件:"+LocalFileName + "结束");		
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return -1;

		}
		return 0;
	}
	/*
	 * 删除远程服务器上的文件
	 */
	public	static	int	deleteRemoteFile(String SrvIp,String User,String Password,int Port,
			String	strFileName){
		FTPClient ftpClient = null; //FTP 客户端代理
		try{
			ftpClient = connectFtpServer(SrvIp,User,Password,Port);
			if(ftpClient == null){
				log.warn("deleteRemoteFile can't   connect FTP SERVER !!!");
				return -1;
			}
			ftpClient.enterLocalPassiveMode();
			ftpClient.deleteFile(strFileName);
			
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		return 0;	
	}
	/*
	 * 查询本地某目录下的所有文件
	 */
	public	static	void		listLocalFile(String localPath){
		File file = new File(localPath);  
		File[]  filetmp= file.listFiles();
		for(File item:filetmp){
			log.info(" filename:"+item.getName() + " length:"+item.length());
		}
	}
	/*
	 * 提取目录
	 */
	public	static	String		getPath(String strFileAll){
		int			LocalSepPos = -1;
		LocalSepPos  = strFileAll.lastIndexOf('/');
		if(LocalSepPos == -1){
			LocalSepPos  = strFileAll.lastIndexOf('\\');
		}
		String	LocalPath = null;
		if(LocalSepPos != -1)
		   LocalPath = strFileAll.substring(0, LocalSepPos);
		return LocalPath;
	}
	/*
	 * 提取文件名
	 */
	public	static String	getFile(String strFileAll){
		int			LocalSepPos = -1;
		LocalSepPos  = strFileAll.lastIndexOf('/');
		if(LocalSepPos == -1){
			LocalSepPos  = strFileAll.lastIndexOf('\\');
		}
		String		fileName = null;
		if(LocalSepPos != -1){
			fileName = strFileAll.substring(LocalSepPos + 1);
		}
		else  fileName = strFileAll;
		return fileName;
	}


}
