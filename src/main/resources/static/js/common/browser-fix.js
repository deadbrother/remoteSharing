/**
 * 解决ie浏览器下不支持trim方法
 * ie 6 7 8 不支持trim方法，无法去掉字符串，采用正则表达式方式进行填补
 */
if(!String.prototype.trim){
	String.prototype.trim = function () {
		return this .replace(/^\s /, '' ).replace(/\s $/, '' );
	};
}