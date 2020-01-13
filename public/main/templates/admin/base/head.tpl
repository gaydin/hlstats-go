<!DOCTYPE html>
<html lang="zxx" class="js">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Fav Icon  -->
    <link rel="shortcut icon" href="images/favicon.png">
    <!-- Site Title  -->
    <title>Ttle</title>
    <!-- Vendor Bundle CSS -->
    <link rel="stylesheet" href="/public/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/public/css/style.css">
</head>

<body class="admin-panel bg-light">

<div class="page-content container-fluid">

    <div class="wrapper row">
        <!-- Sidebar  -->
        <nav class="col-md-3 d-none d-md-block sidebar">
            <div class="sidebar-header">
                <a class="" href="/"><img src="/public/hlstatsimg/icons/sourcebans/title.png"
                                          alt="HLstatsX Community Edition" title="HLstatsX Community Edition"></a>
            </div>

            {{ template "admin/side_menu" .games }}
        </nav>

        <!-- Page Content  -->
        <div id="content" class="col-md-9 ml-sm-auto">

{{ template "admin/base/nav" . }}