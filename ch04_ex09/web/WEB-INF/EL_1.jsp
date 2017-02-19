<html>
<head>
    <title>Expression Language</title>
</head>
<body>
<h1>Expression Language Question 1</h1>
<h2>How do I use implicit objects?</h2>
<p>The implicit objects are</p>
<ul>
    <li>pageContext</li>
    <li>pageScope</li>
    <li>requestScope</li>
    <li>sessionScope</li>
    <li>applicationScope</li>
    <li>param</li>
    <li>paramValues</li>
    <li>header</li>
    <li>headerValues</li>
    <li>cookie</li>
    <li>initParam</li>
</ul>

<p>
    Implicit objects form the lvalue of the EL expression, and their
    properties are accessed using the . or [] operator. Here are some
    examples:
</p>
<%--
    The four lines afer this comment contain special expression syntax
    needed to display a literal ${} in the output of a JSP. This is done
    by using an expression to evaluate the literal '${}'. That is, the
    expression ${ '${' } evaluates to ${, and whatever follows the
    expression is treated as normal template text.
--%>
<p>
    ${'${'}pageContext.request.requestURI} evaluates to
    "${pageContext.request.requestURI}"
</p>
<p>
    ${'${'}param.qid} evaluates to "${param.qid}"
</p>
<p>
    ${'${'}header.referer} evaluates to "${header.referer}"
</p>
<p>
    ${'${'}cookie.JSESSIONID.value} evaluates to "${cookie.JSESSIONID.value}"
</p>
</body>
</html>