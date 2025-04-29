<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.do">
            <i class="fa fa-cubes fa-lg mr-2"></i>
            <strong>Article Manager</strong>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-cubes mr-1"></i> Article Management
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/articles.do">
                            <i class="fa fa-list mr-2"></i> View All
                        </a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/createArticle.do">
                            <i class="fa fa-plus-circle mr-2"></i> Add New
                        </a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/searchArticles.do">
                            <i class="fa fa-search mr-2"></i> Search
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <i class="fa fa-chart-bar mr-2"></i> Reports
                        </a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/articles.do">
                        <i class="fa fa-home mr-1"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fa fa-cog mr-1"></i> Settings
                    </a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/searchArticles.do" method="post">
                <div class="input-group">
                    <input class="form-control" type="search" name="description" placeholder="Search articles..." aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-light" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fa fa-bell mr-1"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-sm btn-outline-light ml-2" href="${pageContext.request.contextPath}/logout.do">
                        <i class="fa fa-sign-out mr-1"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>