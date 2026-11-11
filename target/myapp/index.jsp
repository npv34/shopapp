<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechShop - Cửa hàng Thương mại Điện tử</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .hero-section {
            background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 50%, #052c65 100%);
            color: #fff;
            border-radius: 1rem;
        }
        .category-card {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            cursor: pointer;
        }
        .category-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.1) !important;
        }
        .product-card {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            border-radius: 0.75rem;
            overflow: hidden;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 .75rem 1.5rem rgba(0,0,0,.1) !important;
        }
        .product-img-wrapper {
            height: 210px;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            position: relative;
        }
        .product-img-wrapper img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
        }
    </style>
</head>
<body>

    <!-- Top Bar -->
    <div class="bg-dark text-light py-1 small">
        <div class="container d-flex justify-content-between align-items-center">
            <div>
                <i class="bi bi-truck me-1 text-warning"></i> Miễn phí vận chuyển cho đơn hàng từ 500.000đ
            </div>
            <div class="d-none d-md-flex gap-3">
                <span><i class="bi bi-telephone me-1"></i> Hotline: 1900 1234</span>
                <span><i class="bi bi-envelope me-1"></i> support@techshop.vn</span>
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top py-3">
        <div class="container">
            <a class="navbar-brand fw-bold fs-4 text-primary d-flex align-items-center" href="${pageContext.request.contextPath}/">
                <i class="bi bi-bag-check-fill me-2"></i>TechShop
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="mainNavbar">
                <!-- Menu chính -->
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active fw-semibold" href="${pageContext.request.contextPath}/">Trang chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            Danh mục
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#products"><i class="bi bi-laptop me-2"></i>Laptop & PC</a></li>
                            <li><a class="dropdown-item" href="#products"><i class="bi bi-phone me-2"></i>Điện thoại</a></li>
                            <li><a class="dropdown-item" href="#products"><i class="bi bi-headphones me-2"></i>Tai nghe & Âm thanh</a></li>
                            <li><a class="dropdown-item" href="#products"><i class="bi bi-smartwatch me-2"></i>Đồng hồ thông minh</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#products">Khuyến mãi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#footer">Liên hệ</a>
                    </li>
                </ul>

                <!-- Thanh tìm kiếm -->
                <form class="d-flex me-lg-3 my-2 my-lg-0" role="search" action="${pageContext.request.contextPath}/" method="get">
                    <div class="input-group">
                        <input class="form-control" type="search" name="q" placeholder="Tìm sản phẩm..." aria-label="Search">
                        <button class="btn btn-outline-primary" type="submit">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </form>

                <!-- Giỏ hàng & Tài khoản -->
                <div class="d-flex align-items-center gap-2">
                    <button type="button" class="btn btn-outline-dark position-relative">
                        <i class="bi bi-cart3"></i>
                        <span class="d-none d-xl-inline ms-1">Giỏ hàng</span>
                        <span id="cartBadge" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                            2
                        </span>
                    </button>

                    <% String currentUser = (String) session.getAttribute("user"); %>
                    <% if (currentUser != null) { %>
                        <div class="dropdown ms-2">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="bi bi-person-check-fill me-1"></i> <%= currentUser %>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/hello?name=<%= currentUser %>">Trang cá nhân</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/auth/logout">Đăng xuất</a></li>
                            </ul>
                        </div>
                    <% } else { %>
                        <a href="${pageContext.request.contextPath}/auth/login" class="btn btn-primary ms-1">
                            <i class="bi bi-box-arrow-in-right me-1"></i>Đăng nhập
                        </a>
                        <a href="${pageContext.request.contextPath}/auth/register" class="btn btn-outline-primary d-none d-sm-inline-block">
                            Đăng ký
                        </a>
                    <% } %>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Container -->
    <main class="container my-4">

        <!-- Hero Banner -->
        <section class="hero-section p-4 p-md-5 mb-5 shadow-sm">
            <div class="row align-items-center">
                <div class="col-lg-7">
                    <span class="badge bg-warning text-dark fw-semibold mb-3 px-3 py-2 rounded-pill">
                        <i class="bi bi-lightning-charge-fill me-1"></i>SIÊU SALE CÔNG NGHỆ
                    </span>
                    <h1 class="display-5 fw-bold mb-3">Nâng Cấp Thiết Bị Công Nghệ Với Giá Ưu Đãi Nhất</h1>
                    <p class="lead mb-4 text-white-50">
                        Giảm ngay đến 35% cho các dòng Laptop, Smartphone và Phụ kiện chính hãng. Bảo hành 12 tháng, giao nhanh trong 2 giờ.
                    </p>
                    <div class="d-flex flex-wrap gap-3">
                        <a href="#products" class="btn btn-light btn-lg fw-semibold text-primary px-4">
                            Mua sắm ngay <i class="bi bi-arrow-right ms-1"></i>
                        </a>
                        <a href="${pageContext.request.contextPath}/auth/register" class="btn btn-outline-light btn-lg px-4">
                            Nhận voucher 200K
                        </a>
                    </div>
                </div>
                <div class="col-lg-5 text-center mt-4 mt-lg-0">
                    <i class="bi bi-laptop display-1" style="font-size: 9rem; opacity: 0.9;"></i>
                </div>
            </div>
        </section>

        <!-- Tiện ích dịch vụ -->
        <section class="row g-3 mb-5">
            <div class="col-6 col-md-3">
                <div class="card border-0 shadow-sm h-100 p-3">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-truck fs-2 text-primary me-3"></i>
                        <div>
                            <h6 class="fw-bold mb-0">Giao hàng siêu tốc</h6>
                            <small class="text-muted">Nội thành trong 2h</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="card border-0 shadow-sm h-100 p-3">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-shield-check fs-2 text-success me-3"></i>
                        <div>
                            <h6 class="fw-bold mb-0">Hàng chính hãng</h6>
                            <small class="text-muted">Bảo hành 100%</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="card border-0 shadow-sm h-100 p-3">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-arrow-repeat fs-2 text-warning me-3"></i>
                        <div>
                            <h6 class="fw-bold mb-0">Đổi trả 30 ngày</h6>
                            <small class="text-muted">Miễn phí đổi mới</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="card border-0 shadow-sm h-100 p-3">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-headset fs-2 text-danger me-3"></i>
                        <div>
                            <h6 class="fw-bold mb-0">Hỗ trợ 24/7</h6>
                            <small class="text-muted">Tư vấn tận tâm</small>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Danh mục nổi bật -->
        <section class="mb-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="fw-bold mb-0">Danh Mục Nổi Bật</h4>
                <a href="#products" class="text-decoration-none small fw-semibold">Xem tất cả <i class="bi bi-chevron-right"></i></a>
            </div>
            <div class="row row-cols-2 row-cols-sm-3 row-cols-lg-6 g-3">
                <div class="col">
                    <div class="card category-card border-0 shadow-sm text-center p-3 h-100">
                        <i class="bi bi-phone fs-1 text-primary mb-2"></i>
                        <h6 class="fw-semibold mb-0">Điện thoại</h6>
                    </div>
                </div>
                <div class="col">
                    <div class="card category-card border-0 shadow-sm text-center p-3 h-100">
                        <i class="bi bi-laptop fs-1 text-success mb-2"></i>
                        <h6 class="fw-semibold mb-0">Laptop</h6>
                    </div>
                </div>
                <div class="col">
                    <div class="card category-card border-0 shadow-sm text-center p-3 h-100">
                        <i class="bi bi-tablet fs-1 text-info mb-2"></i>
                        <h6 class="fw-semibold mb-0">Máy tính bảng</h6>
                    </div>
                </div>
                <div class="col">
                    <div class="card category-card border-0 shadow-sm text-center p-3 h-100">
                        <i class="bi bi-headphones fs-1 text-danger mb-2"></i>
                        <h6 class="fw-semibold mb-0">Tai nghe</h6>
                    </div>
                </div>
                <div class="col">
                    <div class="card category-card border-0 shadow-sm text-center p-3 h-100">
                        <i class="bi bi-smartwatch fs-1 text-warning mb-2"></i>
                        <h6 class="fw-semibold mb-0">Smartwatch</h6>
                    </div>
                </div>
                <div class="col">
                    <div class="card category-card border-0 shadow-sm text-center p-3 h-100">
                        <i class="bi bi-mouse2 fs-1 text-secondary mb-2"></i>
                        <h6 class="fw-semibold mb-0">Phụ kiện</h6>
                    </div>
                </div>
            </div>
        </section>

        <!-- Danh sách sản phẩm -->
        <section id="products" class="mb-5">
            <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
                <div>
                    <h4 class="fw-bold mb-1">Sản Phẩm Bán Chạy</h4>
                    <p class="text-muted small mb-0">Các sản phẩm được khách hàng yêu thích nhất tuần qua</p>
                </div>
                <div class="btn-group mt-2 mt-sm-0" role="group">
                    <button type="button" class="btn btn-sm btn-primary active">Tất cả</button>
                    <button type="button" class="btn btn-sm btn-outline-primary">Mới nhất</button>
                    <button type="button" class="btn btn-sm btn-outline-primary">Giảm giá sâu</button>
                </div>
            </div>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">

                <!-- Sản phẩm 1 -->
                <div class="col">
                    <div class="card product-card border-0 shadow-sm h-100">
                        <div class="product-img-wrapper">
                            <span class="badge bg-danger position-absolute top-0 start-0 m-3">-15%</span>
                            <i class="bi bi-laptop text-primary" style="font-size: 5rem;"></i>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <span class="text-muted small">Laptop</span>
                            <h6 class="card-title fw-bold mt-1">MacBook Air M3 13 inch 2024 (8GB/256GB)</h6>
                            <div class="text-warning small mb-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <span class="text-muted ms-1">(128)</span>
                            </div>
                            <div class="mt-auto">
                                <div class="mb-3">
                                    <span class="fs-5 fw-bold text-danger">26.990.000₫</span>
                                    <span class="text-muted text-decoration-line-through small ms-2">31.990.000₫</span>
                                </div>
                                <button class="btn btn-outline-primary w-100 fw-semibold" onclick="addToCart()">
                                    <i class="bi bi-cart-plus me-1"></i> Thêm vào giỏ
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sản phẩm 2 -->
                <div class="col">
                    <div class="card product-card border-0 shadow-sm h-100">
                        <div class="product-img-wrapper">
                            <span class="badge bg-success position-absolute top-0 start-0 m-3">Mới</span>
                            <i class="bi bi-phone text-dark" style="font-size: 5rem;"></i>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <span class="text-muted small">Điện thoại</span>
                            <h6 class="card-title fw-bold mt-1">iPhone 16 Pro Max 256GB Chính hãng VN/A</h6>
                            <div class="text-warning small mb-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <span class="text-muted ms-1">(342)</span>
                            </div>
                            <div class="mt-auto">
                                <div class="mb-3">
                                    <span class="fs-5 fw-bold text-danger">33.490.000₫</span>
                                    <span class="text-muted text-decoration-line-through small ms-2">34.990.000₫</span>
                                </div>
                                <button class="btn btn-outline-primary w-100 fw-semibold" onclick="addToCart()">
                                    <i class="bi bi-cart-plus me-1"></i> Thêm vào giỏ
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sản phẩm 3 -->
                <div class="col">
                    <div class="card product-card border-0 shadow-sm h-100">
                        <div class="product-img-wrapper">
                            <span class="badge bg-danger position-absolute top-0 start-0 m-3">-25%</span>
                            <i class="bi bi-headphones text-danger" style="font-size: 5rem;"></i>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <span class="text-muted small">Âm thanh</span>
                            <h6 class="card-title fw-bold mt-1">Tai nghe Bluetooth Sony WH-1000XM5 Chống ồn</h6>
                            <div class="text-warning small mb-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star"></i>
                                <span class="text-muted ms-1">(89)</span>
                            </div>
                            <div class="mt-auto">
                                <div class="mb-3">
                                    <span class="fs-5 fw-bold text-danger">6.490.000₫</span>
                                    <span class="text-muted text-decoration-line-through small ms-2">8.490.000₫</span>
                                </div>
                                <button class="btn btn-outline-primary w-100 fw-semibold" onclick="addToCart()">
                                    <i class="bi bi-cart-plus me-1"></i> Thêm vào giỏ
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sản phẩm 4 -->
                <div class="col">
                    <div class="card product-card border-0 shadow-sm h-100">
                        <div class="product-img-wrapper">
                            <span class="badge bg-warning text-dark position-absolute top-0 start-0 m-3">Bán chạy</span>
                            <i class="bi bi-smartwatch text-success" style="font-size: 5rem;"></i>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <span class="text-muted small">Smartwatch</span>
                            <h6 class="card-title fw-bold mt-1">Apple Watch Series 10 GPS 42mm Viền Nhôm</h6>
                            <div class="text-warning small mb-2">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <span class="text-muted ms-1">(64)</span>
                            </div>
                            <div class="mt-auto">
                                <div class="mb-3">
                                    <span class="fs-5 fw-bold text-danger">10.590.000₫</span>
                                    <span class="text-muted text-decoration-line-through small ms-2">11.990.000₫</span>
                                </div>
                                <button class="btn btn-outline-primary w-100 fw-semibold" onclick="addToCart()">
                                    <i class="bi bi-cart-plus me-1"></i> Thêm vào giỏ
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

    </main>

    <!-- Footer -->
    <footer id="footer" class="bg-dark text-light pt-5 pb-3 mt-5">
        <div class="container">
            <div class="row g-4 mb-4">
                <div class="col-md-4">
                    <h5 class="fw-bold text-white mb-3">
                        <i class="bi bi-bag-check-fill text-primary me-2"></i>TechShop
                    </h5>
                    <p class="text-secondary small">
                        Hệ thống bán lẻ thiết bị công nghệ chính hãng uy tín hàng đầu. Cam kết chất lượng, giá tốt cùng dịch vụ hậu mãi chu đáo.
                    </p>
                </div>
                <div class="col-6 col-md-2">
                    <h6 class="fw-bold text-white mb-3">Liên kết</h6>
                    <ul class="list-unstyled small text-secondary">
                        <li class="mb-2"><a href="${pageContext.request.contextPath}/" class="text-decoration-none text-secondary">Trang chủ</a></li>
                        <li class="mb-2"><a href="#products" class="text-decoration-none text-secondary">Sản phẩm</a></li>
                        <li class="mb-2"><a href="${pageContext.request.contextPath}/auth/login" class="text-decoration-none text-secondary">Đăng nhập</a></li>
                        <li class="mb-2"><a href="${pageContext.request.contextPath}/auth/register" class="text-decoration-none text-secondary">Đăng ký</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md-3">
                    <h6 class="fw-bold text-white mb-3">Chính sách</h6>
                    <ul class="list-unstyled small text-secondary">
                        <li class="mb-2">Chính sách bảo hành</li>
                        <li class="mb-2">Chính sách đổi trả</li>
                        <li class="mb-2">Chính sách bảo mật</li>
                        <li class="mb-2">Hướng dẫn mua trả góp</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h6 class="fw-bold text-white mb-3">Nhận tin khuyến mãi</h6>
                    <div class="input-group mb-2">
                        <input type="email" class="form-control form-control-sm" placeholder="Nhập email của bạn...">
                        <button class="btn btn-primary btn-sm" type="button">Đăng ký</button>
                    </div>
                    <small class="text-secondary">Nhận ngay mã giảm giá 10% cho đơn đầu tiên.</small>
                </div>
            </div>
            <hr class="border-secondary">
            <div class="text-center small text-secondary">
                &copy; 2026 TechShop E-Commerce. Powered by Java Servlet &amp; Bootstrap 5.
            </div>
        </div>
    </footer>

    <!-- Bootstrap 5.3 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function addToCart() {
            const badge = document.getElementById('cartBadge');
            badge.textContent = parseInt(badge.textContent || '0', 10) + 1;
        }
    </script>
</body>
</html>
