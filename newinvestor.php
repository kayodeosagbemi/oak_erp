<?php
session_start();
include_once 'includes/Investor.class.php';
include_once 'includes/Database.php';
//Declare all form fields below
$txtSurname="";
$txtMiddlename="";
$txtFirstname="";
$txtMobile="";
$txtEmail="";
$txtEmail2="";
$txtPwd="";
$txtPwd2="";
$txtTitle="";
$txtDob = "";
$txtGender="";
$errorMessageArr = array();

if (isset($_POST['btnCancel']))
{
  echo "<h1>HELLLOOOOOOOOOOOOOOOOOOOOOOOOOO!!!</h1>";
  //Empty all the variables.
  // $txtSurname="";
  // $txtMiddlename="";
  // $txtFirstname="";
  // $txtMobile="";
  // $txtEmail="";
  // $txtEmail2="";
  // $txtPwd="";
  // $txtPwd2="";
}


if (isset($_POST['btnCreateInvestor']))
{
  echo "<b>DEBUG::Submit button clicked</b>";
  //get the information from the form fields 
  $txtEmail     = input("txtEmail");
  $txtEmail2    = input("txtEmail2");
  $txtPwd       = input("txtPwd");
  $txtPwd2      = input("txtPwd2");
  //do server-side validation
    //Check email and password are matching
    if ($txtEmail != $txtEmail2)
    {
      //
      echo "<b>DEBUG::The EMail do not match</b>";
      $errorMessageArr[] = "<p>The email addresses don't match.</p>";
    }
    if ($txtPwd != $txtPwd2)
    {
      print("<b>DEBUG::The EMail do not match</b>");
      $errorMessageArr[] = "<p>The password you entered don't match.</p>";
    }
    echo "<b>DEBUG::About to fill investor Object</b>";
    if (count($errorMessageArr) == 0) //This means there are no errors because the array of error messages is zero.
    {
      //Create an instance of the investor class
      $investorObj = new Investor();
      $investorObj->setSurname(input("txtSurname"));
      $investorObj->setMiddlename(input("txtMiddlename"));
      $investorObj->setFirstname(input('txtFirstname'));
      $investorObj->setMobilePhoneNumber(input('txtMobile'));
      $investorObj->setPassword(input("txtPwd"));
      $investorObj->setUsername(input('txtEmail'));
      $investorObj->setCreateTime(date('Y-m-d H:i:s'));
      $investorObj->setTitle(input('txtTitle'));
      $investorObj->setDateOfBirth(input('txtDob'));
      $investorObj->setGender(input('txtGender'));
      $investorObj->setResidentialAddress(input('txtResidentialAddress'));
      $investorObj->setCountryOfResidence(input('txtCountry'));
      $investorObj->setCreatedByUserId($_SESSION['USER_ID']);
      $investorObj->setInvestorReferralCode($investorObj->generateReferralCode(input("txtSurname"), input("txtMobile")));
      $investorObj->setETLId(NULL);
      $investorObj->setEtlCreateTime(NULL);
      $investorObj->setCreationApprovedByUserId($_SESSION['USER_ID']);
      $investorObj->setCreationApprovedByUserId(date('Y-m-d H:i:s'));
      $investorObj->setRecordStatus(1);
      $investorObj->setReferrerId(NULL);

      $is_saved= FALSE;

      $is_saved = $investorObj->save();

      if ($is_saved)
      {
          //Show a prompt here.
      } else
      {
        $errorMessageArr[] = "<p>Could not save the investor details.</p>";
      }
    }
}


?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo $_SESSION['USER_FULL_NAME']; ?> | </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span><?php  echo $_SESSION['TENANT_NAME']; ?></span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2><?php echo $_SESSION['USER_FULL_NAME'] ; ?></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.html">Dashboard</a></li>
                      <li><a href="index2.html">Dashboard2</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i>Investor Actions<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="newinvestor.php">New Investor</a></li>
                      <li><a href="newinvestor_wizard.php">New Investor and Investment</a></li>
                    </ul>
                  </li>                  
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/img.jpg" alt=""><?php echo $_SESSION['USER_FULL_NAME'] ; ?>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="index.php?action=logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>New Investor </h3>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Bio-Data Entry</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <form class="form-horizontal form-label-left" novalidate method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                      <span class="section">Bio-Data</span>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtTitle">Title
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <!-- <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="name" placeholder="Surname" required="required" type="text"> -->
                          <input id="txtTitle" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="txtTitle" placeholder="Mr., Mrs., Miss" type="text" value="<?php echo $txtTitle; ?>">
                        </div>
                      </div>
                      <div class="item form-group">                        
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtSurname">Surname <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <!-- <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="name" placeholder="Surname" required="required" type="text"> -->
                          <input id="txtSurname" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="txtSurname" placeholder="Surname" required="required" type="text" value="<?php echo $txtSurname; ?>">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtMiddlename">Middlename
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <!-- <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="name" placeholder="Surname" required="required" type="text"> -->
                          <input id="txtMiddlename" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="txtMiddlename" placeholder="Middle Name" type="text" value="<?php echo $txtMiddlename; ?>">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtFirstname">Firstname <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <!-- <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="name" placeholder="Surname" required="required" type="text"> -->
                          <input id="txtFirstname" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="txtFirstname" placeholder="First Name" required="required" type="text" value="<?php echo $txtFirstname; ?>">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtEmail">Email 
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="txtEmail" name="txtEmail" class="form-control col-md-7 col-xs-12" value="<?php echo $txtEmail; ?>">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Confirm Email <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="txtEmail2" name="txtEmail2" data-validate-linked="txtEmail" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="txtPwd" class="control-label col-md-3">Password</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="txtPwd" type="password" name="txtPwd" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="txtPwd2" class="control-label col-md-3 col-sm-3 col-xs-12">Repeat Password</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="txtPwd2" type="password" name="txtPwd2" data-validate-linked="txtPwd" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtMobile">Telephone (mobile) <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="tel" id="txtMobile" name="txtMobile" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12" value="<?php echo $txtMobile; ?>">
                        </div>
                      </div> 
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtDob">Date of Birth
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="txtDob" class="form-control col-md-7 col-xs-12" name="txtDob" placeholder="1990-01-28" type="date" value="<?php echo $txtDob; ?>">
                        </div>
                      </div>    
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtGender">Gender
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                            <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-default">
                                <input type="radio" name="txtGender" id="M" value="M" required> Male
                              </label>
                              <label class="btn btn-default">
                                <input type="radio" name="txtGender" id="F" value="F" required> Female
                              </label>
                            </div>
                          </div>
                         </div>
                      </div>                                         
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <button type="submit" id="btnCancel" name="btnCancel" class="btn btn-primary">Cancel</button>
                          <button id="btnCreateInvestor" name="btnCreateInvestor" type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            <?php echo $_SESSION['TENANT_NAME']; ?>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
    <script src="vendors/validator/validator.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>

    <!-- validator -->
    <script>
      // initialize the validator function
      validator.message.date = 'not a real date';

      // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
      $('form')
        .on('blur', 'input[required], input.optional, select.required', validator.checkField)
        .on('change', 'select.required', validator.checkField)
        .on('keypress', 'input[required][pattern]', validator.keypress);

      $('.multi.required').on('keyup blur', 'input', function() {
        validator.checkField.apply($(this).siblings().last()[0]);
      });

      $('form').submit(function(e) {
        e.preventDefault();
        var submit = true;

        // evaluate the form using generic validaing
        if (!validator.checkAll($(this))) {
          submit = false;
        }

        if (submit)
          this.submit();

        return false;
      });
    </script>
    <!-- /validator -->
  </body>
</html>