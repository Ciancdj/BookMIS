<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Please input amount of money</title>
    <link rel="stylesheet" href="<%=basePath%>\\bootstrap-4.0.0-dist\\css\\bootstrap.min.css">
  </head>
  
  <body style="overflow-x:hidden; overflow-y:hidden">
  	<c:if test="${returnList != null}">
  		<c:forEach items="${returnList}" var="ret" varStatus="status">
  			<div class="row">
  				<div class="col-md-12">
  					<h5 class="color:blue"><a href="#" onclick="breakout('${detailURL}','${ret.bookid}')">${ret.bookname}</a></h5>
  					<span class="color:grey">${ret.bookindex}</span><br/>
  					<div class="row">
  						<div class="col-md-10">
  							<span class="color:grey">${ret.bookauthor} , ${ret.bookpress}</span><br/>
  						</div>
  						<div class="col-md-2">
  							<span class="color:grey">可借/馆藏 ${ret.borrowable} / ${ret.booknum}</span>
  						</div>
  					</div>
  				</div>
  			</div><hr/>
  		</c:forEach>
  		<c:if test="${maxPage > nowPage}">
  			<div class="row">
  				<div class="col-md-2"></div>
  				<div class="col-md-9">
  					<ul class="pagination pagination-lg">
  					<c:if test = "${nowPage - 1 > 0}">
  						<li class="page-item"><a href="#" class="page-link" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
  					</c:if>
					<c:forEach var="i" begin="${leftPage}" end="${rightPage}"><li class="page-item" >
						<c:if test = "${i == nowPage}"><a href="${pageURL}?page=${i}" class="page-link active">${i}</a></c:if>
						<c:if test = "${i != nowPage}"><a href="${pageURL}?page=${i}" class="page-link">${i}</a></c:if></li></c:forEach>
					<c:if test = "${nowPage + 1 <= rightPage}">
						<li class="page-item"><a href="${pageURL}?page=${nowPage+1}" class="page-link" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					</ul>
  				</div>
  				<div class="col-md-1"></div>
  			</div>
  			
  		</c:if>
  	</c:if>
  	
  	<c:if test="${returnList == null}">
  		<div class="jumbotron">
			<h3>中图法</h3>
				<p>
				《中国图书馆图书分类法》是我国建国后编制出版的一部具有代表性的大型综合性分类法，简称《中图法》
				《中图法》的编制始于1971年，先后出版了四版。
				《中图法》与国内其他分类法相比，编制产生年代较晚，但发展很快，它不仅系统地总结了我国分类法的编制经验，而且还吸取了国外分类法的编制理论和技术。 它按照一定的思想观点，以学科分类为基础，结合图书资料的内容和特点，分门别类组成分类表。
				目前，《中图法》已普遍应用于全国各类型的图书馆，国内主要大型书目、检索刊物、机读数据库，以及《中国国家标准书号》等都著录《中图法》分类号。
				《中图法》采用汉语拼音字母与阿拉伯数字相结合的混合号码，用一个字母代表一个大类，以字母顺序反映大类的次序， 大类下细分的学科门类用阿拉伯数字组成。为适应工业技术发展及该类文献的分类，对工业技术二级类目，采用双字母。
				</p>
		</div>
  	</c:if>
  	<script type="text/javascript">
		function breakout(url,str)
		{
			if (window.top!=window.self) 
			{
				window.top.location= url+str;
			}
		}
	</script>
  	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="<%=basePath%>\\bootstrap-4.0.0-dist\\js\\bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
