<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="vi">

<head>
  <title>Danh sÃ¡ch nhÃ¢n viÃªn | Quáº£n trá» Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
  <!-- Navbar-->
  <header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
      aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


      <!-- User Menu-->
      <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>

      </li>
    </ul>
  </header>
  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px"
        alt="User Image">
      <div>
        <p class="app-sidebar__user-name"><b>VÃµ TrÆ°á»ng</b></p>
        <p class="app-sidebar__user-designation">ChÃ o má»«ng báº¡n trá» láº¡i</p>
      </div>
    </div>
    <hr>
    <ul class="app-menu">
      <li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i class='app-menu__icon bx bx-cart-alt'></i>
          <span class="app-menu__label">POS BÃ¡n HÃ ng</span></a></li>
      <li><a class="app-menu__item active" href="index.html"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Báº£ng Äiá»u khiá»n</span></a></li>
      <li><a class="app-menu__item " href="table-data-table.html"><i class='app-menu__icon bx bx-id-card'></i> <span
            class="app-menu__label">Quáº£n lÃ½ nhÃ¢n viÃªn</span></a></li>
      <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-user-voice'></i><span
            class="app-menu__label">Quáº£n lÃ½ khÃ¡ch hÃ ng</span></a></li>
      <li><a class="app-menu__item" href="table-data-product.html"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quáº£n lÃ½ sáº£n pháº©m</span></a>
      </li>
      <li><a class="app-menu__item" href="table-data-oder.html"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quáº£n lÃ½ ÄÆ¡n hÃ ng</span></a></li>
      <li><a class="app-menu__item" href="table-data-banned.html"><i class='app-menu__icon bx bx-run'></i><span
            class="app-menu__label">Quáº£n lÃ½ ná»i bá»
          </span></a></li>
      <li><a class="app-menu__item" href="table-data-money.html"><i class='app-menu__icon bx bx-dollar'></i><span
            class="app-menu__label">Báº£ng kÃª lÆ°Æ¡ng</span></a></li>
      <li><a class="app-menu__item" href="quan-ly-bao-cao.html"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">BÃ¡o cÃ¡o doanh thu</span></a>
      </li>
      <li><a class="app-menu__item" href="page-calendar.html"><i class='app-menu__icon bx bx-calendar-check'></i><span
            class="app-menu__label">Lá»ch cÃ´ng tÃ¡c </span></a></li>
      <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">CÃ i
            Äáº·t há» thá»ng</span></a></li>
    </ul>
  </aside>
  <main class="app-content">
    <div class="row">
      <div class="col-md-12">
        <div class="app-title">
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Báº£ng Äiá»u khiá»n</b></a></li>
          </ul>
          <div id="clock"></div>
        </div>
      </div>
    </div>
    <div class="row">
      <!--Left-->
      <div class="col-md-12 col-lg-6">
        <div class="row">
       <!-- col-6 -->
       <div class="col-md-6">
        <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
          <div class="info">
            <h4>Tá»ng khÃ¡ch hÃ ng</h4>
            <p><b>56 khÃ¡ch hÃ ng</b></p>
            <p class="info-tong">Tá»ng sá» khÃ¡ch hÃ ng ÄÆ°á»£c quáº£n lÃ½.</p>
          </div>
        </div>
      </div>
       <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
              <div class="info">
                <h4>Tá»ng sáº£n pháº©m</h4>
                <p><b>1850 sáº£n pháº©m</b></p>
                <p class="info-tong">Tá»ng sá» sáº£n pháº©m ÄÆ°á»£c quáº£n lÃ½.</p>
              </div>
            </div>
          </div>
           <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>Tá»ng ÄÆ¡n hÃ ng</h4>
                <p><b>247 ÄÆ¡n hÃ ng</b></p>
                <p class="info-tong">Tá»ng sá» hÃ³a ÄÆ¡n bÃ¡n hÃ ng trong thÃ¡ng.</p>
              </div>
            </div>
          </div>
           <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
              <div class="info">
                <h4>Sáº¯p háº¿t hÃ ng</h4>
                <p><b>4 sáº£n pháº©m</b></p>
                <p class="info-tong">Sá» sáº£n pháº©m cáº£nh bÃ¡o háº¿t cáº§n nháº­p thÃªm.</p>
              </div>
            </div>
          </div>
           <!-- col-12 -->
           <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">TÃ¬nh tráº¡ng ÄÆ¡n hÃ ng</h3>
              <div>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>ID ÄÆ¡n hÃ ng</th>
                      <th>TÃªn khÃ¡ch hÃ ng</th>
                      <th>Tá»ng tiá»n</th>
                      <th>Tráº¡ng thÃ¡i</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>AL3947</td>
                      <td>Pháº¡m Thá» Ngá»c</td>
                      <td>
                        19.770.000 Ä
                      </td>
                      <td><span class="badge bg-info">Chá» xá»­ lÃ½</span></td>
                    </tr>
                    <tr>
                      <td>ER3835</td>
                      <td>Nguyá»n Thá» Má»¹ Yáº¿n</td>
                      <td>
                        16.770.000 Ä	
                      </td>
                      <td><span class="badge bg-warning">Äang váº­n chuyá»n</span></td>
                    </tr>
                    <tr>
                      <td>MD0837</td>
                      <td>Triá»u Thanh PhÃº</td>
                      <td>
                        9.400.000 Ä	
                      </td>
                      <td><span class="badge bg-success">ÄÃ£ hoÃ n thÃ nh</span></td>
                    </tr>
                    <tr>
                      <td>MT9835</td>
                      <td>Äáº·ng HoÃ ng PhÃºc	</td>
                      <td>
                        40.650.000 Ä	
                      </td>
                      <td><span class="badge bg-danger">ÄÃ£ há»§y	</span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- / div trá»ng-->
            </div>
           </div>
            <!-- / col-12 -->
             <!-- col-12 -->
            <div class="col-md-12">
                <div class="tile">
                  <h3 class="tile-title">KhÃ¡ch hÃ ng má»i</h3>
                <div>
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>TÃªn khÃ¡ch hÃ ng</th>
                        <th>NgÃ y sinh</th>
                        <th>Sá» Äiá»n thoáº¡i</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>#183</td>
                        <td>Há»t vá»t muá»i</td>
                        <td>21/7/1992</td>
                        <td><span class="tag tag-success">0921387221</span></td>
                      </tr>
                      <tr>
                        <td>#219</td>
                        <td>BÃ¡nh trÃ¡ng trá»n</td>
                        <td>30/4/1975</td>
                        <td><span class="tag tag-warning">0912376352</span></td>
                      </tr>
                      <tr>
                        <td>#627</td>
                        <td>CÃºt rang bÆ¡</td>
                        <td>12/3/1999</td>
                        <td><span class="tag tag-primary">01287326654</span></td>
                      </tr>
                      <tr>
                        <td>#175</td>
                        <td>Há»§ tiáº¿u nam vang</td>
                        <td>4/12/20000</td>
                        <td><span class="tag tag-danger">0912376763</span></td>
                      </tr>
                    </tbody>
                  </table>
                </div>

              </div>
            </div>
             <!-- / col-12 -->
        </div>
      </div>
      <!--END left-->
      <!--Right-->
      <div class="col-md-12 col-lg-6">
        <div class="row">
          <div class="col-md-12">
            <div class="tile">
              <h3 class="tile-title">Dá»¯ liá»u 6 thÃ¡ng Äáº§u vÃ o</h3>
              <div class="embed-responsive embed-responsive-16by9">
                <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="tile">
              <h3 class="tile-title">Thá»ng kÃª 6 thÃ¡ng doanh thu</h3>
              <div class="embed-responsive embed-responsive-16by9">
                <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!--END right-->
    </div>


    <div class="text-center" style="font-size: 13px">
      <p><b>Copyright
          <script type="text/javascript">
            document.write(new Date().getFullYear());
          </script> Pháº§n má»m quáº£n lÃ½ bÃ¡n hÃ ng | Dev By TrÆ°á»ng
        </b></p>
    </div>
  </main>
  <script src="js/jquery-3.2.1.min.js"></script>
  <!--===============================================================================================-->
  <script src="js/popper.min.js"></script>
  <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
  <!--===============================================================================================-->
  <script src="js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="js/main.js"></script>
  <!--===============================================================================================-->
  <script src="js/plugins/pace.min.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript" src="js/plugins/chart.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript">
    var data = {
      labels: ["ThÃ¡ng 1", "ThÃ¡ng 2", "ThÃ¡ng 3", "ThÃ¡ng 4", "ThÃ¡ng 5", "ThÃ¡ng 6"],
      datasets: [{
        label: "Dá»¯ liá»u Äáº§u tiÃªn",
        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
        strokeColor: "rgb(255, 212, 59)",
        pointColor: "rgb(255, 212, 59)",
        pointStrokeColor: "rgb(255, 212, 59)",
        pointHighlightFill: "rgb(255, 212, 59)",
        pointHighlightStroke: "rgb(255, 212, 59)",
        data: [20, 59, 90, 51, 56, 100]
      },
      {
        label: "Dá»¯ liá»u káº¿ tiáº¿p",
        fillColor: "rgba(9, 109, 239, 0.651)  ",
        pointColor: "rgb(9, 109, 239)",
        strokeColor: "rgb(9, 109, 239)",
        pointStrokeColor: "rgb(9, 109, 239)",
        pointHighlightFill: "rgb(9, 109, 239)",
        pointHighlightStroke: "rgb(9, 109, 239)",
        data: [48, 48, 49, 39, 86, 10]
      }
      ]
    };
    var ctxl = $("#lineChartDemo").get(0).getContext("2d");
    var lineChart = new Chart(ctxl).Line(data);

    var ctxb = $("#barChartDemo").get(0).getContext("2d");
    var barChart = new Chart(ctxb).Bar(data);
  </script>
  <script type="text/javascript">
    //Thá»i Gian
    function time() {
      var today = new Date();
      var weekday = new Array(7);
      weekday[0] = "Chá»§ Nháº­t";
      weekday[1] = "Thá»© Hai";
      weekday[2] = "Thá»© Ba";
      weekday[3] = "Thá»© TÆ°";
      weekday[4] = "Thá»© NÄm";
      weekday[5] = "Thá»© SÃ¡u";
      weekday[6] = "Thá»© Báº£y";
      var day = weekday[today.getDay()];
      var dd = today.getDate();
      var mm = today.getMonth() + 1;
      var yyyy = today.getFullYear();
      var h = today.getHours();
      var m = today.getMinutes();
      var s = today.getSeconds();
      m = checkTime(m);
      s = checkTime(s);
      nowTime = h + " giá» " + m + " phÃºt " + s + " giÃ¢y";
      if (dd < 10) {
        dd = '0' + dd
      }
      if (mm < 10) {
        mm = '0' + mm
      }
      today = day + ', ' + dd + '/' + mm + '/' + yyyy;
      tmp = '<span class="date"> ' + today + ' - ' + nowTime +
        '</span>';
      document.getElementById("clock").innerHTML = tmp;
      clocktime = setTimeout("time()", "1000", "Javascript");

      function checkTime(i) {
        if (i < 10) {
          i = "0" + i;
        }
        return i;
      }
    }
  </script>
  
	<script>
		function toggleUserMenu() {
			var dropdown = document.getElementById('userDropdown');
			if (dropdown) {
				dropdown.classList.toggle('active');
			}
		}

		document.addEventListener('click', function(event) {
			var userMenu = document.querySelector('.user-menu');
			var dropdown = document.getElementById('userDropdown');

			if (userMenu && dropdown && !userMenu.contains(event.target)) {
				dropdown.classList.remove('active');
			}
		});
	</script>
  
</body>

</html>