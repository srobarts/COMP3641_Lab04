
<jsp:include page="header.jsp"></jsp:include>

<%@ page errorPage="errorPage.jsp" %>

<%! 	public void jspInit(){
			ServletConfig sConfig = getServletConfig();
			String dburl = sConfig.getInitParameter("dburl");
			System.out.println("The dburl is "+ dburl);
		}
%>

<jsp:useBean id="DatabaseBean" class="businesslogic_lab04.DatabaseBean" />
<jsp:setProperty name="DatabaseBean" property="URL" value="" />

<p>URL: <jsp:getProperty name="DatabaseBean" property="URL" /></p>


		<div id="content">
			<div id="stylized" class="myform">
				<form id="form" name="form" method="post" action="query_database">
					<p>Input a correct SQL statement below to query the database.<br />
					Query results will be show on the following page after submission.</p>
					
					<h3>Sample Query:</h3>
					<p>SELECT * FROM beatles<br />
					SELECT * FROM beatles WHERE title LIKE '%Help%'</p>
					
					
					<label>Query:
					<span class="small">Please input your query:</span><br />
					</label>
					<input SIZE=50 name="query" id="query" />
					
					<button type="submit">Submit</button>
					<div class="spacer"></div>
				</form>
			</div>
		</div>

<jsp:include page="footer.jsp"></jsp:include>