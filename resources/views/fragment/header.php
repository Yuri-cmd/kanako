<header id="page-topbar">
    <div class="navbar-header">
        <div class="d-flex">
            <!-- LOGO -->
            <div class="navbar-brand-box" style="background-color: #00a65a !important;">
                <a href="index.html" class="logo logo-dark">
                <span class="logo-lg" style="color: #fff; font-size: 2rem;"><i class="mdi mdi-bulletin-boar"></i> <b>E.S.A.M.A.</b> </span>
                </a>

                <a href="index.html" class="logo logo-light">
                <span class="logo-lg" style="color: #fff; font-size: 2rem;"><i class="mdi mdi-bulletin-boar"></i> <b>E.S.A.M.A.</b> </span>
                </a>
            </div>

            <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect" id="vertical-menu-btn">
                <i class="mdi mdi-menu"></i>
            </button>


        </div>

        <div class="d-flex">
            <!-- App Search-->




            <div class="dropdown d-none d-lg-inline-block">
                <button type="button" class="btn header-item noti-icon waves-effect" data-bs-toggle="fullscreen">
                    <i class="mdi mdi-fullscreen"></i>
                </button>
            </div>

            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                </button>
                <div class="dropdown-menu dropdown-menu-end">
                    <!-- item-->

                    <div class="dropdown-divider"></div>
                    <a id="logout" class="dropdown-item text-danger" href="<?=URL::to('/logout')?>"><i class="bx bx-power-off font-size-17 align-middle me-1 text-danger"></i> Logout</a>
                </div>
            </div>



        </div>
    </div>
</header>