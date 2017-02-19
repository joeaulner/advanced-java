<%@ taglib uri="/questions" prefix="faq" %>
<html>
<head>
    <title>Topic Questions</title>
</head>
<body>
<h1>Topic Questions</h1>
<faq:listFaqs topic="${param.topic}">
</faq:listFaqs>
</body>
</html>
