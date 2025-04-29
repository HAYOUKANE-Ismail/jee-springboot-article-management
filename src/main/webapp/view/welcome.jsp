<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Articles - Article Manager</title>
    <link href="webjars/bootstrap/4.6.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="webjars/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
    <style>
        .bg-gradient-primary {
            background: linear-gradient(to right, #007bff, #0056b3);
        }
        .text-gradient-primary {
            background: linear-gradient(to right, #007bff, #0056b3);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: bold;
        }
        .shadow-hover {
            transition: all 0.3s ease;
        }
        .shadow-hover:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
    </style>
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.6.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="common/header.jsp"%>

<div class="container mt-4">
    <div class="card shadow-hover">
        <div class="card-header bg-gradient-primary text-white d-flex justify-content-between align-items-center">
            <h2 class="mb-0">
                <i class="fa fa-clipboard-list mr-2"></i> Article List
            </h2>
            <div>
                <a href="${pageContext.request.contextPath}/createArticle.do" class="btn btn-light">
                    <i class="fa fa-plus-circle mr-1"></i> Add New Article
                </a>
                <a href="${pageContext.request.contextPath}/searchArticles.do" class="btn btn-outline-light ml-2">
                    <i class="fa fa-search mr-1"></i> Advanced Search
                </a>
            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-striped table-hover mb-0">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col"><i class="fa fa-hashtag mr-1"></i> Id</th>
                        <th scope="col"><i class="fa fa-file-alt mr-1"></i> Description</th>
                        <th scope="col"><i class="fa fa-cubes mr-1"></i> Quantity</th>
                        <th scope="col"><i class="fa fa-tag mr-1"></i> Price</th>
                        <th scope="col" class="text-center"><i class="fa fa-cogs mr-1"></i> Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${articles}" var="article">
                        <tr>
                            <th scope="row">${article.id}</th>
                            <td>${article.description}</td>
                            <td>
                                        <span class="badge ${article.quantite > 20 ? 'badge-success' : article.quantite > 10 ? 'badge-warning' : 'badge-danger'} badge-pill">
                                                ${article.quantite}
                                        </span>
                            </td>
                            <td>$${article.price}</td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/updateArticle.do?id=${article.id}" class="btn btn-sm btn-warning mr-1">
                                    <i class="fa fa-edit"></i> Edit
                                </a>
                                <a href="${pageContext.request.contextPath}/deleteArticle.do?id=${article.id}" class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure you want to delete this article?')">
                                    <i class="fa fa-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center mb-0">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                            <i class="fa fa-chevron-left mr-1"></i> Previous
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next <i class="fa fa-chevron-right ml-1"></i></a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp"%>
</body>
</html>