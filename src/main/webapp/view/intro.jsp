<div class="container mt-4">
    <div class="jumbotron bg-primary text-white shadow-sm">
        <h1 class="display-4">
            <i class="fa fa-cubes mr-2"></i> Welcome to Article Manager
        </h1>
        <p class="lead">A comprehensive solution for managing your inventory with ease.</p>
        <hr class="my-4 bg-white">
        <p>Get started by exploring the articles or adding new items to your inventory.</p>
        <div class="mt-4">
            <a class="btn btn-light btn-lg mr-2" href="${pageContext.request.contextPath}/articles.do" role="button">
                <i class="fa fa-list mr-1"></i> View Articles
            </a>
            <a class="btn btn-outline-light btn-lg" href="${pageContext.request.contextPath}/createArticle.do" role="button">
                <i class="fa fa-plus mr-1"></i> Add New Article
            </a>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-hover">
                <div class="card-body text-center">
                    <div class="bg-primary text-white rounded-circle mx-auto mb-4"
                         style="width: 80px; height: 80px; display: flex; align-items: center; justify-content: center;">
                        <i class="fa fa-search fa-2x"></i>
                    </div>
                    <h5 class="card-title text-primary">Search Articles</h5>
                    <p class="card-text">Find articles quickly using our advanced search functionality with filters for price and quantity.</p>
                    <a href="${pageContext.request.contextPath}/searchArticles.do" class="btn btn-outline-primary">
                        <i class="fa fa-search mr-1"></i> Search Now
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-hover">
                <div class="card-body text-center">
                    <div class="bg-secondary text-white rounded-circle mx-auto mb-4"
                         style="width: 80px; height: 80px; display: flex; align-items: center; justify-content: center;">
                        <i class="fa fa-edit fa-2x"></i>
                    </div>
                    <h5 class="card-title text-primary">Manage Inventory</h5>
                    <p class="card-text">Add, edit, and remove articles from your inventory with our intuitive interface.</p>
                    <a href="${pageContext.request.contextPath}/articles.do" class="btn btn-outline-primary">
                        <i class="fa fa-tasks mr-1"></i> Manage Now
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-hover">
                <div class="card-body text-center">
                    <div class="bg-success text-white rounded-circle mx-auto mb-4"
                         style="width: 80px; height: 80px; display: flex; align-items: center; justify-content: center;">
                        <i class="fa fa-chart-bar fa-2x"></i>
                    </div>
                    <h5 class="card-title text-primary">View Reports</h5>
                    <p class="card-text">Generate reports and gain insights into your inventory data with visual analytics.</p>
                    <a href="#" class="btn btn-outline-primary">
                        <i class="fa fa-chart-line mr-1"></i> View Reports
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .shadow-hover {
        transition: all 0.3s ease;
    }
    .shadow-hover:hover {
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transform: translateY(-5px);
    }
</style>