<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<title>Registration Success</title>
		</head>
		<body style="color: #dddddd;">
			<div align="center">
				<table border="1">
					<tr>
						<td colspan="2" align="center"><h2>Rejestracja pomyślna</h2></td>
					</tr>
					<tr>
						<td>Nazwa użtykownika</td>
						<td>${username}</td>
					</tr>
					<tr>
						<td>Adres email:</td>
						<td>${email}</td>
					</tr>
				</table>
			</div>
		</body>
		</html>
	</tiles:putAttribute>
</tiles:insertDefinition>