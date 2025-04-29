<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results - Article Manager</title>
    <link href="webjars/bootstrap/4.6.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="webjars/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
    <style>
        .bg-gradient-primary {
            background: linear-gradient(to right, #007bff, #0056b3);
        }
        .icon-spacing {
            margin-right: 8px;
        }
    </style>
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.6.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="common/header.jsp"%>

<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-gradient-primary text-white d-flex justify-content-between align-items-center">
            <h3 class="mb-0"><i class="fa fa-search icon-spacing"></i>Search Results</h3>
            <a href="${pageContext.request.contextPath}/searchArticles.do" class="btn btn-outline-light">
                <i class="fa fa-search icon-spacing"></i>New Search
            </a>
        </div>
        <div class="card-body">
            <c:if test="${empty articles}">
                <div class="alert alert-info">
                    <i class="fa fa-info-circle icon-spacing"></i>No articles found matching your criteria.
                </div>
            </c:if>
            <c:if test="${not empty articles}">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><i class="fa fa-hashtag icon-spacing"></i>ID</th>
                            <th><i class="fa fa-file-text icon-spacing"></i>Description</th>
                            <th><i class="fa fa-cubes icon-spacing"></i>Quantity</th>
                            <th><i class="fa fa-tag icon-spacing"></i>Price</th>
                            <th class="text-center"><i class="fa fa-cogs icon-spacing"></i>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${articles}" var="article">
                            <tr>
                                <td>${article.id}</td>
                                <td>${article.description}</td>
                                <td>
                                            <span class="badge badge-pill ${article.quantite > 20 ? 'badge-success' : article.quantite > 10 ? 'badge-warning' : 'badge-danger'}">
                                                    ${article.quantite}
                                            </span>
                                </td>
                                <td>$${article.price}</td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/updateArticle.do?id=${article.id}" class="btn btn-sm btn-warning mr-1">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/deleteArticle.do?id=${article.id}" class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this article?')">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp"%>
</body>
</html>