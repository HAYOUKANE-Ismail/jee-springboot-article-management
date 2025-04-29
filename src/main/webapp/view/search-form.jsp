<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Articles - Article Manager</title>
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
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-header bg-gradient-primary text-white">
                    <h3 class="mb-0"><i class="fa fa-search icon-spacing"></i>Search Articles</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/searchArticles.do" method="post">
                        <div class="form-group">
                            <label for="description"><i class="fa fa-file-text icon-spacing"></i>Description</label>
                            <input type="text" class="form-control" id="description" name="description" placeholder="Enter keywords to search">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <h5 class="mb-3">
                                    <i class="fa fa-tag icon-spacing"></i> Price Range
                                </h5>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="minPrice">Min Price</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-dollar"></i></span>
                                                </div>
                                                <input type="number" step="0.01" class="form-control" id="minPrice" name="minPrice" placeholder="0.00">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="maxPrice">Max Price</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-dollar"></i></span>
                                                </div>
                                                <input type="number" step="0.01" class="form-control" id="maxPrice" name="maxPrice" placeholder="1000.00">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h5 class="mb-3">
                                    <i class="fa fa-cubes icon-spacing"></i> Quantity Range
                                </h5>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="minQuantity">Min Quantity</label>
                                            <input type="number" step="0.01" class="form-control" id="minQuantity" name="minQuantity" placeholder="0">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="maxQuantity">Max Quantity</label>
                                            <input type="number" step="0.01" class="form-control" id="maxQuantity" name="maxQuantity" placeholder="100">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-4 text-right">
                            <a href="${pageContext.request.contextPath}/articles.do" class="btn btn-secondary mr-2">
                                <i class="fa fa-arrow-left icon-spacing"></i>Back to List
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-search icon-spacing"></i>Search Articles
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