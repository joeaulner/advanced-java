<%@ taglib uri="/simplequestions" prefix="faq" %>
<html>
<head>
    <title>Topic Questions</title>
</head>
<body>
<h1>Topic Questions</h1>
<faq:simplelist topic="${param.topic}">
    <p>
        Question <a href="Questions.jsp?qid=${qid}">${qid}</a>
            ${question}
    </p>
</faq:simplelist>
<p>Click a link to get the answer.</p>
</body>
</html>