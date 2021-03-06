{**
	* header.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2000-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Common site header.
	*}
	{strip}
	{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
	{if $pageCrumbTitle}
	{translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
	{elseif !$pageCrumbTitleTranslated}
	{assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
	{/if}
	{/strip}

	<html xmlns="http://www.w3.org/1999/xhtml" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
		<title>{$pageTitleTranslated}</title>
		<meta name="description" content="{$metaSearchDescription|escape}" />
		<meta name="keywords" content="{$metaSearchKeywords|escape}" />
		<meta name="generator" content="{$applicationName} {$currentVersionString|escape}" />
		{$metaCustomHeaders}
		{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}

		<link rel="stylesheet" type="text/css" href="{$baseUrl}/bower_components/bootstrap/dist/css/bootstrap.min.css">
		<!-- <link rel="stylesheet" type="text/css" href="{$baseUrl}/bower_components/flat_ui/css/flat-ui.css"> -->
		<link rel="stylesheet" type="text/css" href="{$baseUrl}/bower_components/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="{$baseUrl}/bower_components/bootstrap-select/dist/css/bootstrap-select.min.css">
		<link rel="stylesheet" type="text/css" href="{$baseUrl}/bower_components/app.css">



		<script type="text/javascript" src="{$baseUrl}/bower_components/jquery/dist/jquery.min.js"></script>
		<script type="text/javascript" src="{$baseUrl}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="{$baseUrl}/bower_components/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

<!-- 		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" /> -->
		<!-- <link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />
		<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" /> -->

		<!-- Base Jquery -->
		{if $allowCDN}<script type="text/javascript" src="//www.google.com/jsapi"></script>
		<script type="text/javascript">{literal}
			<!--
			// Provide a local fallback if the CDN cannot be reached
			if (typeof google == 'undefined') {
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
			} else {
				google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
				google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
			}
			// -->
			{/literal}</script>
			{else}
			<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
			<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
			{/if}

			{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
			{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
			{if $leftSidebarCode || $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />{/if}
			{if $leftSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />{/if}
			{if $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />{/if}
			{if $leftSidebarCode && $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" />{/if}

			{foreach from=$stylesheets item=cssUrl}
			<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
			{/foreach}

			<!-- Default global locale keys for JavaScript -->
			{include file="common/jsLocaleKeys.tpl" }

			<!-- Compiled scripts -->
			{if $useMinifiedJavaScript}
			<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
			{else}
			{include file="common/minifiedScripts.tpl"}
			{/if}

			<!-- Form validation -->
			<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/validate/jquery.validate.js"></script>
			<script type="text/javascript">
				<!--
		// initialise plugins
		{literal}
		$(function(){
			jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation localization
			{/literal}{if $validateId}{literal}
			$("form[name={/literal}{$validateId}{literal}]").validate({
				errorClass: "error",
				highlight: function(element, errorClass) {
					$(element).parent().parent().addClass(errorClass);
				},
				unhighlight: function(element, errorClass) {
					$(element).parent().parent().removeClass(errorClass);
				}
			});
			{/literal}{/if}{literal}
			$(".tagit").live('click', function() {
				$(this).find('input').focus();
			});
		});
		// -->
		{/literal}
	</script>

	{if $hasSystemNotifications}
	{url|assign:fetchNotificationUrl page='notification' op='fetchNotification' escape=false}
	<script type="text/javascript">
		$(function(){ldelim}
			$.get('{$fetchNotificationUrl}', null,
				function(data){ldelim}
				var notifications = data.content;
				var i, l;
				if (notifications && notifications.general) {ldelim}
					$.each(notifications.general, function(notificationLevel, notificationList) {ldelim}
						$.each(notificationList, function(notificationId, notification) {ldelim}
							$.pnotify(notification);
							{rdelim});
						{rdelim});
				{rdelim}
				{rdelim}, 'json');
			{rdelim});
	</script>
	{/if}{* hasSystemNotifications *}

	{$additionalHeadData}
</head>
<body id="pkp-{$pageTitle|replace:'.':'-'}">
	{include file="common/navbar.tpl"}





	<br>

	<div  class="container width-def" >
		<div class="row">

			{if $leftSidebarCode || $rightSidebarCode}
			<div id="sidebar col-md-2">
				
				{if $rightSidebarCode}
				<div class="col-md-3">
					{$rightSidebarCode}
				</div>
				{/if}
				{if $leftSidebarCode}
				<div  class="col-md-2 ">
					{$leftSidebarCode}
				</div>
				{/if}
			</div>
			{/if}

			<div   class="col-md-8 ">

				<div class="row">
					{include file="common/breadcrumbs.tpl"}
				</div>
				<div class="row">

					<h2>{$pageTitleTranslated}</h2>

					{if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
					{if $pageSubtitleTranslated}
					<h3>{$pageSubtitleTranslated}</h3>
					{/if}
				</div>
				<div class="row">


