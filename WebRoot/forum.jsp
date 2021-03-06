<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Your Basic Site Informations -->
	<title>论坛</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="description"
		content="ForFuture News新闻网站,Servlet ,Tomcat ,JSP项目开发" />
	<meta name="keywords"
		content="Site Template, News, Magazine, Portofolio, HTML, CSS, 
		   				jQuery, Newsletter, PHP Contact, 
						Subscription, Responsive, Marketing, Clean, SEO" />
	<meta name="author" content="mike zhong" />
	
	<!-- Mobile Specific Meta -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="css/flexslider.css">
	<link rel="stylesheet" href="css/prettyPhoto.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/theme-layout.css">
	
	<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="apple-touch-icon" sizes="72x72"	href="images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
	
	<style type="text/css">
	#registForm {
		background-color: #f3c7b8;
	}
	
	#templatemo_newsletter_section_regist label {
		margin-top: -30px;
	}
	
	#templatemo_newsletter_section_regist h2 {
		font-size: 27px;
		text-align: center;
		color: #f15620;
		text-shodw: 1px 1px #f15620;
	}
	
	hr {
		width: 90%;
		height: 3px;
	}
	
	.form_row1 {
		font-size: 16px;
		margin-left: 300px;
	}
	
	.form_row1 input {
		width: 210px;
		height: 36px;
	}
	
	.form_row1 .button {
		width: 60px;
		text-align: center;
	}
	
	#checkResult {
		color: red;
		font-size: 12px;
	}
	</style>
	
	<!-- JavaScript -->
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type='text/javascript' src='js/bootstrap.min.js'></script>
	<script type='text/javascript' src='js/jquery.easing.js'></script>
	<script type='text/javascript' src='js/jquery.flexslider-min.js'></script>
	<script type='text/javascript' src='js/jflickrfeed.min.js'></script>
	<script type='text/javascript' src='js/jquery.fitvids.min.js'></script>
	<script type='text/javascript' src='js/jquery.lazyload.mini.js'></script>
	<script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
	<script type='text/javascript' src='js/jquery.placeholder.min.js'></script>
	<script type='text/javascript' src='js/jquery.jticker.js'></script>
	<script type='text/javascript' src='js/jquery.mobilemenu.js'></script>
	<script type='text/javascript' src='js/jquery.isotope.min.js'></script>
	<script type='text/javascript' src='js/jquery.hoverdir.js'></script>
	<script type='text/javascript' src='js/modernizr.custom.js'></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript">
		
		function showReply() {
			$("#addReply").show();
		};
		
		function showMoreReply() {
			var reply=$(".reply");
			var tempDiv=$("<div></div>");
			tempDiv.html(
				"<textarea></textarea>");
				
		};
		
		$().ready(function(){
			$("#addReply").hide();				
		});
		
		//Ajax异步请求，添加论坛回复
		function addReply(){
			//1.获取当前页面的discussId值
			var discussId=${forumInfo.id };
			//获取评论区中的内容
			var content =$("#content").val();						
			//2.发送Ajax请求
			$.post(
				"Front?op=addReply",//ajax的请求URL地址
				{"discussId":discussId,"content":content},
				//3.服务器请求成功，在页面显示登录的结果
				function(data){
					alert(data);//弹出服务器返回的结果
					$("#reply").val("");//清空评论去的内容，方便下次在评论
					window.location.reload(true);//加载评论列表，保证最新的评论实时显示
				}
			);
		}
	</script>
</head>

<body>
	<!---中间主模块main start---->
	<div class="theme-layout">
		<!-- Stretched/Boxed Layout -->

		<!---顶部导航 start---->
		<div id="top-navigation">
			<div class="container">
				<!-- Navigation start-->
				<ul class="nav-menu pull-left">
					<li class=""><a href="Front?op=main"
						style="color: #fffcfc;font-size: 29px;font-family: '楷体';">
							FroFuture News新闻网站 </a></li>
				</ul>
				<!-- Navigation end-->

				<!-- 整个网络Search Form start-->
				<form name="form-search" method="post"
					action="Front?op=query&search=theweb"
					class="form-search pull-right">
					<input type="text" name="q" placeholder="整个网络...."
						class="input-icon input-icon-search" /> <input type="submit"
						name="Search" value="搜索" alt="Search" id="searchbutton" title="搜索" />
				</form>
				<!-- Search Form end-->

			</div>
			<!-- End Container -->
		</div>
		<!-- End Top-Navigation -->
		<!---顶部导航 end---->

		<!---container主要容器 start---->
		<div class="container">
			<!--头部 start-->
			<header id="header" class="clearfix">

				<!-- Logo -->
				<div class="logo pull-left">
					<a href="Front?op=main"> <img src="images/logo.png"
						alt="ForFuture NEWS" />
					</a>
				</div>

				<!-- Ads -->
				<div class="ads pull-right">
					<!--<img src="images/ads/480x80.png" alt="广告" />-->
					<p
						style="float: left;font-size: 26px;color: #ea1c1c;font-weight: 700;
							text-shadow: 55px -17px #f15620;">
						ForFuture News</p>
					<!-- 本网络Search Form start-->
					<form name="form-search" method="post"
						action="Front?op=query&search=thissite">
						<input type="text" name="q" placeholder="本网络......" /> <input
							type="submit" name="submit" value="Search" />
					</form>
				</div>

			</header>
			<!-- End Header -->
			<!--头部 end-->

			<!---导航 start---->
			<nav id="main-navigation" class="clearfix">
				<ul>
					<li><a href="Front?op=main" class="current">主页</a></li>
					<c:forEach items="${classList }" var="c" end="8">
						<li><a href="Front?op=listByClass&classId=${c.classId }">${c.content }</a></li>
					</c:forEach>
				</ul>
			</nav>
			<!-- End Main-Navigation -->
			<!---导航 end---->

			<!---headlines动态显示  start---->
			<div class="headlines clearfix">
				<!--固定时间 start--->
				<span class="base"> <script type="text/javascript">
					var currentTime = new Date();
					var date = currentTime.getDate();
					document.write(date);
				</script> <i> <script type="text/javascript">
					var d_names = new Array("周日", "周一", "周二", "周三", "周四", "周五",
							"周六");
					var currentTime = new Date();
					var day = currentTime.getDay();
					document.write(d_names[day]);
				</script>
				</i>
				</span>
				<!--移动时间 start--->
				<span
					style="color:white;font-size:16px;margin-left:220px;margin-top:8px;">
					<script type="text/javascript">
						var m_names = new Array("一月", "二月", "三月", "四月", "五月",
								"六月", "七月", "八月", "September", "October",
								"November", "December");
						var d_names = new Array("周日", "周一", "周二", "周三", "周四",
								"周五", "周六");
						//获取当前系统的时间 年月日
						var currentTime = new Date();
						var day = currentTime.getDay();
						var month = currentTime.getMonth() + 1;
						var date = currentTime.getDate();
						var year = currentTime.getFullYear();

						document.write(d_names[day] + "   " + date + " "
								+ m_names[month - 1] + " " + year + "  ");
						//获取当前时间 时 分 秒
						var currentTime = new Date();
						var hours = currentTime.getHours();
						var minutes = currentTime.getMinutes();
						if (minutes < 10) {
							minutes = "0" + minutes;
						}
						document.write(hours + ":" + minutes + " ");
						if (hours > 11) {
							document.write("PM");
						} else {
							document.write("AM");
						}
					</script>
				</span>
				<!--时间 end--->
				<!---动态通知 start--->
				<div class="text-rotator">
					<div>
						<a href="#" title="Hubei Polytechnic University 湖北理工学院">Hubei
							Polytechnic University 湖北理工学院 甘全中</a>
					</div>
					<div>
						<a href="#" title="ForFuture NEWS新闻">ForFuture NEWS新闻</a>
					</div>
					<div>
						<a href="#" title="Web full stack engineer">Web full stack
							engineer</a>
					</div>
					<div>
						<a href="#" title="ganquanzhong mike zhong ">ganquanzhong mike
							zhong </a>
					</div>
					<div>
						<a href="#"
							title="Big data  Cloud computing  Artificial intelligence">Big
							data Cloud computing Artificial intelligence</a>
					</div>
				</div>
				<!---动态通知 end--->
			</div>
			<!-- End Headlines -->
			<!---headlines动态显示  end---->

			<!---dispaly:none--->
			<div class="copyrights">
				Collect from <a href="index.jsp">甘全中</a>
			</div>

			<!---######新闻Content内容  start---->
			<div class="row-fluid">
				<!---左侧Main start--->
				<div id="main" class="span8 image-preloader">
					<!-- Start Row-Fluid -->
					<div class="row-fluid" style="height:100%;">
						<!--##论坛 start-->
						<div class="forumHead">
							<span>ForFuture 论坛</span>
						</div>
						<div class="forum demo">
							<div id="main_column">
								<div class="forumMain">
									<h2>${forumInfo.subject}</h2>
									<!-- 论坛人信息 -->
									<div id="person">
										<img alt="" src="images/forumImg.jpg"> <br> <a
											href="#" title="${forumInfo.username}"> <span>${forumInfo.username}</span>
										</a> <a href="#" title="${forumInfo.email }"> <span>${forumInfo.email }</span>
										</a>
									</div>

									<div class="clear"></div>
									<img class="forum_image" src="images/${forumInfo.pictures}"
										alt="image" /> <br />

									<p>${forumInfo.content}</p>

									<span style="color:white;">发表论坛人：${forumInfo.name} </span> <span
										style="margin-left:45px;color:white;">发表于：${forumInfo.formatTime}
									</span>

									<div class="cleaner"></div>
								</div>
								<h4>
									<a href="javascript:showReply();">回帖</a>
									<a href="Front?op=beforeForum">写论坛</a>
								</h4>
								
								<div id="addReply">
									<textarea name="content" id="content" rows="5" cols="400" 
										width="100%" height="50px">
									</textarea>
									<br /> 
									<a href="javascript:addReply()">
										<input class="pull-left" type="button" value="发评论" > 
									</a>
									<br /><br />还未登录？请先登录！
									<a	href="#templatemo_newsletter_section">登录</a><br />
								</div>
								
								<div class="cleaner"></div>
							</div>
							<!-- end of main forum -->
						</div>

						<!-- 显示回复论坛 start -->
						<c:forEach items="${replyList }" var="reply">
							<div class="reply">
								<!-- 论坛人信息 -->
								<div id="Rperson">
									<span style="color:red;font-size: 16px;font-family: '黑体';">回复</span>
									<a href="#">
										<span style="color:#56f7ffcf;font-size: 17px;">${forumInfo.username}</span>
									</a>
									<img alt="" src="images/forumPerson.jpg"> <br> <a
										href="#" title="${reply.name}"> <span>${reply.name}</span>
									</a>
								</div>
								<!-- 论坛人回复信息 -->
								<div id="replyContent">
									<div style="width:100%;height:100%;padding: 29px 0 0 28px;">
										<p>${reply.content }</p>
									</div>
								</div>
								<div id="replyInfo">
									<span>
										回复于：${reply.fromatTime}
										&nbsp;&nbsp;||&nbsp;&nbsp;来自移动客户端&nbsp;&nbsp;
										<a href="javascript:showMoreReply();"><input type="button" value="回复" ><a>
									</span>
								</div>
								<br>								
							</div>
						</c:forEach>

						<!-- 显示回复论坛 end -->
						<!--##论坛 end-->

						<div class="clearfix ie-sep"></div>
						<!-- Clearfix 换行-->
					</div>
					<!-- End Row-Fluid -->
				</div>
				<!-- End Main -->
				<!---左侧Main end--->

				<!---右侧SideBar start--->
				<jsp:include page="right.jsp"></jsp:include>
				<!---右侧SideBar end--->

			</div>
			<!-- End Row-Fluid -->
			<!---######新闻Content内容  end---->
		</div>
		<!-- End Container -->
		<!---container主要容器 end---->

		<!---bottom底部  start---->
		<div id="bottom">
			<div class="container">
				<div class="row-fluid">

					<div class="span3 widget clearfix">
						<div class="header">
							<h4>关于我们</h4>
						</div>

						<div class="content">
							<span> Hadoop AWS 移动游戏 Java Android iOS Swift 智能硬件 Docker
								OpenStack <br /> <br /> VPN Spark ERP IE10 Eclipse CRM
								JavaScript 数据库 Ubuntu NFC WAP <br /> <br /> jQuery BI HTML5
								Spring Apache .NET API HTML SDK IIS Fedora XML <br /> <br />
								LBS Unity Splashtop UML components Windows Mobile Rails <br />
								<br /> 甘全中
							</span>
						</div>
					</div>
					<!--1 End Widget -->

					<div class="span3 widget clearfix">
						<div class="tags-cloud">

							<div class="header">
								<h4>标签云</h4>
							</div>

							<ul>
								<li><a href="http://www.microsoft.com">windows</a></li>
								<li><a href="http://www.apple.com">apple</a></li>
								<li><a href="http://www.microsoft.com">software</a></li>
								<li><a href="http://www.apache.com">hardware</a></li>
								<li><a href="http://www.apache.org/">gadget</a></li>
								<li><a href="http://www.apache.org/">smartphone</a></li>

								<li><a href="http://www.apache.org/">Java Web</a></li>
								<li><a href="http://www.runoob.com/">Java EE</a></li>
								<li><a href="http://www.runoob.com/">JavaScript</a></li>
								<li><a href="http://www.runoob.com/">jQuery</a></li>
								<li><a href="http://www.runoob.com/">菜鸟教程</a></li>
								<li><a
									href="https://cn.linkedin.com/in/%E5%85%A8%E4%B8%AD-%E7%94%98-9b4126112">ganquanzhong</a>
								</li>

								<li><a href="index.jsp">ForFuture NEWS</a></li>
							</ul>

						</div>
					</div>
					<!--2 End Widget -->

					<div class="span3 widget clearfix">
						<div class="tweets">

							<div class="header">
								<h4>Latest推特</h4>
							</div>

							<ul>
								<li><span class="picons"> <!-- -->
								</span>
									<p>
										<a href="http://blog.csdn.net/">@CSDN GQZ</a> CSDN (Chinese
										Software Developer Network) 创立于1999年， 是中国最大的IT社区和服务平台，
										为中国的软件开发者和IT从业者提供知识传播、职业发展、软件开发等全生命周期服务
									</p> <span class="date">- 10 hours ago</span></li>

								<li><span class="picons"> <!-- -->
								</span>
									<p>
										<a href="https://gitee.com/">@GQZ ForFuture</a>
										码云(gitee.com)是开源中国社区团队推出的基于Git的快速的、
										免费的、稳定的在线代码托管平台,不限制私有库和公有库数量.
									</p> <span class="date">- 2 days ago</span></li>
							</ul>

						</div>
					</div>
					<!--3 End Widget -->

					<div class="span3 widget clearfix">
						<div class="flickr-photos">

							<div class="header">
								<h4>技术推送</h4>
							</div>

							<ul id="flickr-gallery">
								<a href="http://www.runoob.com" target="_blank">学的不仅是技术,更是梦想!</a>
								菜鸟教程(www.runoob.com)提供了最全的编程技术基础教程,
								介绍了HTML、CSS、Javascript、Python,Java,Ruby,C,PHP ,
								MySQL等各种编程语言的基础知识。
							</ul>

						</div>
					</div>
					<!--4 End Widget -->

				</div>
				<!-- End Row-Fluid -->
			</div>
			<!-- End Container -->
		</div>
		<!-- End Bottom -->
		<!---bottom底部  end---->

		<!---footer页脚  start---->
		<div id="footer">
			<div class="container">
				<!--版权所有 start--->
				<p class="pull-left">
					Copyright&copy;2017~2020 Mike Zhong&nbsp;&nbsp;
					|&nbsp;&nbsp;版权所有&nbsp;&nbsp; |&nbsp;&nbsp;违法必究&nbsp;&nbsp;
					|&nbsp;&nbsp; <a href="http://ganquanzhong.top/" target="_blank"
						title="ganquanzhong">FuFuture Share</a>&nbsp;ForFuture News <a href="#"
						target="_blank" title="ganquanzhong">mike zhong</a>
			      <img alt="公网安备" src="images/icp.png" width="20px" height="20px">	
				  <a href="http://www.beian.gov.cn/portal/registerSystemInfo" target="_blank">鄂ICP备18005830号</a>
				</p>
				<!--社会 推送 start--->
				<ul class="social pull-right">
					<li><a href="#" title="Youtube"><img
							src="images/social/f0101/youtube.png" alt="Youtube" /></a></li>
					<li><a href="#" title="LinkedIn"><img
							src="images/social/f0101/linkedin.png" alt="LinkedIn" /></a></li>
					<li><a href="#" title="Vimeo"><img
							src="images/social/f0101/vimeo.png" alt="Vimeo" /></a></li>
					<li><a href="#" title="Tumblr"><img
							src="images/social/f0101/tumblr.png" alt="Tumblr" /></a></li>
					<li><a href="#" title="Flickr"><img
							src="images/social/f0101/flickr.png" alt="Flickr" /></a></li>
					<li><a href="#" title="DeviantArt"><img
							src="images/social/f0101/deviantart.png" alt="DeviantArt" /></a></li>
					<li><a href="#" title="Delicious"><img
							src="images/social/f0101/delicious.png" alt="Delicious" /></a></li>
					<li><a href="#" title="Facebook"><img
							src="images/social/f0101/facebook.png" alt="Facebook" /></a></li>
					<li><a href="#" title="Twitter"><img
							src="images/social/f0101/twitter.png" alt="Twitter" /></a></li>
				</ul>
				<!--社会 推送 end--->
			</div>
			<!-- End Container -->
		</div>
		<!-- End Footer -->
		<!---footer页脚  end---->

	</div>
	<!-- End Theme-Layout -->
	<!---中间主模块main end---->


	<!---返回顶部 start--Scroll滚回头部-->
	<a href="#" class="scrollup" title="返回头部!">滚动</a>
	<!---返回顶部 start---->

	<!---定制customized主题设置 start---->
	<div id="customize">
		<h5>选项</h5>
		<div class="wrapper">
			<!---全局颜色 start---->
			<div class="colors">
				<h6>颜色</h6>
				<a href="#" class="orange" title="Orange"
					style="background-color:#f15620;"></a> <a href="#" class="blue"
					title="Blue" style="background-color:#1d96e2;"></a> <a href="#"
					class="green" title="Green" style="background-color:#45b519;"></a>
			</div>
			<!---全局颜色 end---->

			<!---全局背景 start---->
			<div class="background">
				<h6>背景</h6>
				<a href="#" class="1" title="Background 1"><img
					src="images/pattern/1.jpg" alt="1" /></a> <a href="#" class="2"
					title="Background 2"><img src="images/pattern/2.jpg" alt="2" /></a>
				<a href="#" class="3" title="Background 3"><img
					src="images/pattern/3.jpg" alt="3" /></a> <a href="#" class="4"
					title="Background 4"><img src="images/pattern/4.jpg" alt="4" /></a>
				<a href="#" class="5" title="Background 5"><img
					src="images/pattern/5.jpg" alt="5" /></a> <a href="#" class="6"
					title="Background 6"><img src="images/pattern/6.jpg" alt="6" /></a>
				<a href="#" class="7" title="Background 7"><img
					src="images/pattern/7.jpg" alt="7" /></a> <a href="#" class="8"
					title="Background 8"><img src="images/pattern/8.jpg" alt="8" /></a>
				<a href="#" class="9" title="Background 9"><img
					src="images/pattern/9.jpg" alt="9" /></a> <a href="#" class="10"
					title="Background 10"><img src="images/pattern/10.jpg" alt="10" /></a>
				<a href="#" class="11" title="Background 11"><img
					src="images/pattern/11.jpg" alt="11" /></a> <a href="#" class="12"
					title="Background 12"><img src="images/pattern/12.jpg" alt="12" /></a>
				<a href="#" class="13" title="Background 13"><img
					src="images/pattern/13.jpg" alt="13" /></a> <a href="#" class="14"
					title="Background 14"><img src="images/pattern/14.jpg" alt="14" /></a>
			</div>
			<!---全局背景 end---->
		</div>
	</div>
	<!---定制customized主题设置 end---->

</body>

</html>