<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>${article != null ? 'Edit' : 'Add'} Article - Article Manager</title>
    <link href="webjars/bootstrap/4.6.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="webjars/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
    <style>
        .bg-gradient-primary {
            background: linear-gradient(to right, #007bff, #0056b3);
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
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card shadow-hover">
                <div class="card-header bg-gradient-primary text-white">
                    <h3 class="mb-0">
                        <i class="fa fa-${article != null ? 'edit' : 'plus-circle'} mr-2"></i> ${article != null ? 'Edit Article' : 'Add New Article'}
                    </h3>
                </div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <i class="fa fa-exclamation-circle mr-2"></i>${error}
                        </div>
                    </c:if>
                    <form action="${article != null ? pageContext.request.contextPath.concat('/updateArticle.do') : pageContext.request.contextPath.concat('/createArticle.do')}" method="post">

                        <!-- Hidden ID field for update -->
                        <c:if test="${article != null}">
                            <input type="hidden" name="id" value="${article.id}" />
                        </c:if>

                        <div class="form-group">
                            <label for="description"><i class="fa fa-file-alt mr-1"></i>Description</label>
                            <input type="text" class="form-control" id="description" name="description" value="${article != null ? article.description : ''}" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="quantite"><i class="fa fa-cubes mr-1"></i>Quantity</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-boxes"></i></span>
                                        </div>
                                        <input type="number" step="0.01" class="form-control" id="quantite" name="quantite" value="${article != null ? article.quantite : ''}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="price"><i class="fa fa-tag mr-1"></i>Price</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-dollar"></i></span>
                                        </div>
                                        <input type="number" step="0.01" class="form-control" id="price" name="price" value="${article != null ? article.price : ''}" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-4 text-right">
                            <a href="${pageContext.request.contextPath}/articles.do" class="btn btn-secondary mr-2">
                                <i class="fa fa-times mr-1"></i> Cancel
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-save mr-1"></i> ${article != null ? 'Update' : 'Save'}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp"%>
</body>
</html>
