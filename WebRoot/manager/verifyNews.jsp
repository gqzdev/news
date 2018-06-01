<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- 引用jstl标签库 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>ForFuture新闻网站后台管理</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="js/index.js"></script>

		<link rel="icon" href="images/icon.jpg" type="x-images/icon"/>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<script type="text/javascript" src="js/modernizr.min.js"></script>

		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.jsort.0.4.js"></script>
		<script type="text/javascript">
		</script>
	</head>

	<body>
		<!--头部 top start--->
		<jsp:include page="generalTop.jsp"></jsp:include>
		<!--头部 top end--->

		<div class="nav-down">
			<!-- 菜单导航栏 start -->
			<jsp:include page="Navigate.jsp"></jsp:include>
			<!-- 菜单导航栏 end -->

			<!----main start---->
			<div class="main-wrap">

				<div class="crumb-wrap">
					<div class="crumb-list"><i class="icon-font"></i>
						<a href="index.jsp">首页</a><span class="crumb-step">&gt;</span>
						<a class="crumb-name" href="#">新闻管理</a><span class="crumb-step">&gt;</span><span>审核文章</span></div>
				</div>
				<div class="result-wrap">
					<div class="result-content">
						<form action="Back?op=Verify&newsId=${news.newsId }" method="post" id="myform" name="myform">
                    		<table class="insert-tab" width="100%">
								<tbody>
									<tr>
										<th width="120"><i class="require-red">*</i>新闻分类：</th>
										<td>
											<!-- 动态生成新闻分类 -->
											<select name="classId" id="classId" class="required">
												<c:forEach items="${classList}" var="c">
													<option value="${c.classId}" <c:if test="${c.classId==news.classId}">selected="selected"</c:if>>${c.content}
													</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									
									<tr>
										<th><i class="require-red">*</i>新闻标题：</th>
										<td>
											<input class="common-text required" id="headTitle" name="headTitle" size="50" type="text" value="${news.headTitle }" readonly="readonly">
											<input name="newsId" type="hidden" value="">
										</td>
									</tr>
									<tr>
										<th>作者：</th>
										<td><input class="common-text" name="author" size="50" type="text" value="${news.author }" readonly="readonly"></td>
									</tr>
									<tr>
										<th>编辑：</th>
										<td><input class="common-text" name="editor" size="50" type="text" value="${news.editor }" readonly="readonly"></td>
									</tr>
									<tr>
										<th>新闻来源：</th>
										<td><input class="common-text" name="newsFrom" size="50" type="text" value="${news.newsFrom }" readonly="readonly"></td>
									</tr>
									<tr>
										<th>是否置顶：</th>
										<td>
											<input name="top" type="radio" value="true" <c:if test="${news.top==1 }">checked="checked"</c:if>>是											
											<input name="top" type="radio" value="false" checked="checked"  <c:if test="${news.top==0 }">checked="checked"</c:if>>否
										</td>
									</tr>
									<tr>
										<th>照片：</th>
										<td><img src="../images/${news.pictures }"></td>
									</tr>

									<tr>
										<th>内容：</th>
										<td>
											<textarea name="content" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10">
												${news.content }
											</textarea>
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<input class="btn btn-primary btn6 mr10" value="审核通过" type="submit">
											<input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>

			</div>
			<!--/main-->
			<!----main end------>

		</div>

		<div class="clear"></div>
		<!--底部版权信息 start-->
		<div class="footer footer_location">
			<div>
				<p class="padding-bottom">
					Copyright &copy; 2017-2020
					<a href="http://www.ganquanzhong.top/mynews/" target="_blank">
						ForFuture News
					</a>
					</span>新闻网 版权所有&copy;
					<br/> <br/>
					<a id="ganquanzhong" href="http://baidu.com/" target="_blank">
						ForFuture 
					</a> mike zhong <img alt="公网安备" src="images/icp.png" width="20px" height="20px">	
				  	<a href="http://www.beian.gov.cn/portal/registerSystemInfo" target="_blank">鄂ICP备18005830号</a>
				</p>
			</div>
		</div>
		<!--底部版权信息 end-->
	</body>

</html>