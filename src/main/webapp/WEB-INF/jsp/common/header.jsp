<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:csrfMetaTags/>

<header class="header">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-5 col-md-5 col-6">
        <div class="header-left d-flex align-items-center">
          <div class="menu-toggle-btn mr-15">
            <button id="menu-toggle" class="main-btn primary-btn btn-hover">
              <i class="lni lni-chevron-left me-2"></i> Menu
            </button>
          </div>
<!--           <div class="header-search d-none d-md-flex"> -->
<!--             <form action="#"> -->
<!--               <input type="text" placeholder="Search..." /> -->
<!--               <button><i class="lni lni-search-alt"></i></button> -->
<!--             </form> -->
<!--           </div> -->
        </div>
      </div>
      <div class="col-lg-7 col-md-7 col-6">
        <div class="header-right">
          <!-- notification start -->
          <div class="notification-box ml-15 d-none d-md-flex">
            <button class="dropdown-toggle" type="button" id="notification" data-bs-toggle="dropdown"
              aria-expanded="false">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M11 20.1667C9.88317 20.1667 8.88718 19.63 8.23901 18.7917H13.761C13.113 19.63 12.1169 20.1667 11 20.1667Z"
                  fill="" />
                <path
                  d="M10.1157 2.74999C10.1157 2.24374 10.5117 1.83333 11 1.83333C11.4883 1.83333 11.8842 2.24374 11.8842 2.74999V2.82604C14.3932 3.26245 16.3051 5.52474 16.3051 8.24999V14.287C16.3051 14.5301 16.3982 14.7633 16.564 14.9352L18.2029 16.6342C18.4814 16.9229 18.2842 17.4167 17.8903 17.4167H4.10961C3.71574 17.4167 3.5185 16.9229 3.797 16.6342L5.43589 14.9352C5.6017 14.7633 5.69485 14.5301 5.69485 14.287V8.24999C5.69485 5.52474 7.60672 3.26245 10.1157 2.82604V2.74999Z"
                  fill="" />
              </svg>
              <span></span>
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notification">
              <li>
                <a href="#0">
                  <div class="image">
                    <img src="${pageContext.request.contextPath}/admin/assets/images/lead/lead-6.png" alt="" />
                  </div>
                  <div class="content">
                    <h6>
                      John Doe
                      <span class="text-regular">
                        comment on a product.
                      </span>
                    </h6>
                    <p>
                      Lorem ipsum dolor sit amet, consect etur adipiscing
                      elit Vivamus tortor.
                    </p>
                    <span>10 mins ago</span>
                  </div>
                </a>
              </li>
              <li>
                <a href="#0">
                  <div class="image">
                    <img src="${pageContext.request.contextPath}/admin/assets/images/lead/lead-1.png" alt="" />
                  </div>
                  <div class="content">
                    <h6>
                      Jonathon
                      <span class="text-regular">
                        like on a product.
                      </span>
                    </h6>
                    <p>
                      Lorem ipsum dolor sit amet, consect etur adipiscing
                      elit Vivamus tortor.
                    </p>
                    <span>10 mins ago</span>
                  </div>
                </a>
              </li>
            </ul>
          </div>
          <!-- notification end -->              
          <!-- profile start -->
          <div class="profile-box ml-15">
            <button class="dropdown-toggle bg-transparent border-0" type="button" id="profile"
              data-bs-toggle="dropdown" aria-expanded="false">
              <div class="profile-info">
                <div class="info">
                  <div class="image">
                    <img src="${pageContext.request.contextPath}/admin/assets/images/profile/profile-1.png" alt="" />
                  </div>
                  <div>
                    <h6 class="fw-500"> <sec:authentication property="principal.fullname" /></h6>
                    <sec:authorize access="!hasRole('ADMIN')">
                  		<p><sec:authentication property="name" /></p>
                  	</sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')">
                  		<p>Admin</p>
                  	</sec:authorize>
                  </div>
                </div>
              </div>
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
	           	<sec:authorize access="!hasRole('ADMIN')">
              		<li>
                		<a href="/employee/profile"><i class="lni lni-user"></i> View Profile</a>
              		</li>
                </sec:authorize>
                <sec:authorize access="hasRole('ADMIN')">
	              	<li>
	                	<a href="/admin/settting"> <i class="lni lni-cog"></i> Settings </a>
	              	</li>
                </sec:authorize>
              <li class="divider"></li>
              <li>
                <a href="/logout"> <i class="lni lni-exit"></i> Sign Out </a>
              </li>
            </ul>
          </div>
          <!-- profile end -->
        </div>
      </div>
    </div>
  </div>
</header>