<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/admin/templet/header.jsp" %>



    <div id="wrapper">

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Back to Admin</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="index.jsp"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li class="selected"><a href="portfolio.html"><i class="fa fa-tasks"></i> Portfolio</a></li>
                    <li><a href="blog.html"><i class="fa fa-globe"></i> Blog</a></li>
                    <li><a href="signup.html"><i class="fa fa-list-ol"></i> SignUp</a></li>
                    <li><a href="register.html"><i class="fa fa-font"></i> Register</a></li>
                    <li><a href="timeline.html"><i class="fa fa-font"></i> Timeline</a></li>
                    <li><a href="forms.html"><i class="fa fa-list-ol"></i> Forms</a></li>
                    <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                    <li><a href="bootstrap-elements.html"><i class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
                    <li><a href="bootstrap-grid.html"><i class="fa fa-table"></i > Bootstrap Grid</a></li>            
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    <li class="dropdown messages-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Messages <span class="badge">2</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">2 New Messages</li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
                        </ul>
                    </li>
                    <li class="dropdown user-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Steve Miller<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                            <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <hr />

        <div class="container">
            <div class="row">
                <div class="text-center">
                    <h1>Completed Projects</h1>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h9.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h8.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h4.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h7.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h3.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h6.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h1.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h2.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="well">
                            <img class="thumbnail img-responsive" alt="Bootstrap template" src="http://www.prepbootstrap.com/Content/images/shared/houses/h5.jpg" />
                            <span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                Excepteur sint occaecat cupidatat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file ="/admin/templet/footer.jsp" %>
    