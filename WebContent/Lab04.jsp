
<jsp:include page="header.jsp"></jsp:include>

<body>
	<div id="wrapper">
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
	</div>
</body>


<jsp:include page="footer.jsp"></jsp:include>