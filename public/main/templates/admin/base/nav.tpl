<nav class="navbar navbar-expand-lg navbar-light bg-white rounded shadow-sm">
    <div class="container-fluid">

        <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-align-left"></i>
            <span>Toggle Sidebar</span>
        </button>
        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-align-justify"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item">
                    <form id="logout" method="post" action="/admin/logout">
                        <a href="#" class="btn btn-outline-danger"
                           onclick="document.getElementById('logout').submit();">
                            Logout
                        </a>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
