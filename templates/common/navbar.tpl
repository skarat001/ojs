{**
 * templates/common/navbar.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}
      <!-- Static navbar -->
      <div class="container-fluid width-def">
     <nav class="navbar navbar-default navbar-inverse container-fluid">
  
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
    
   <li id="home"><a href="{url page="index"}"  class="btn btn-link">UI Journal</a></li>
		<li id="about"><a href="{url page="about"}" class="btn btn-link">{translate key="navigation.about"}</a></li>

		{if $isUserLoggedIn}
			<li id="userHome"><a href="{url journal="index" page="user"}" class="btn btn-link">{translate key="navigation.userHome"}</a></li>
		{else}
			<li id="login"><a href="{url page="login"} class="btn btn-link"">{translate key="navigation.login"}</a></li>
			{if !$hideRegisterLink}
				<li id="register"><a href="{url page="user" op="register"}" class="btn btn-link">{translate key="navigation.register"}</a></li>
			{/if}
		{/if}{* $isUserLoggedIn *}

		{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="search" op="categories"}" class="btn btn-link">{translate key="navigation.categories"}</a></li>
		{/if}{* $categoriesEnabled *}

		{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="search"><a href="{url page="search"}" class="btn btn-link">{translate key="navigation.search"}</a></li>
		{/if}

		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="current"><a href="{url page="issue" op="current"}" class="btn btn-link">{translate key="navigation.current"}</a></li>
			<li id="archives"><a href="{url page="issue" op="archive"}" class="btn btn-link">{translate key="navigation.archives"}</a></li>
		{/if}

		{if $enableAnnouncements}
			<li id="announcements"><a href="{url page="announcement"}" class="btn btn-link">{translate key="announcement.announcements"}</a></li>
		{/if}{* enableAnnouncements *}

		{call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}

		{foreach from=$navMenuItems item=navItem key=navItemKey}
			{if $navItem.url != '' && $navItem.name != ''}
				<li class="navItem" id="navItem-{$navItemKey|escape}"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}" class="btn btn-link">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
      </ul>
  
      <ul class=" navbar-form navbar-right">
        <li>
         <select class="selectpicker form-control" data-style="btn-primary" id="languageSelect" {if $isPostRequest}disabled="disabled" {/if}size="1" name="locale" onchange ="changeLanguage()">
 {html_options options=$languageToggleLocales selected=$currentLocale}
</select>

         </li>
       
      </ul>
    </div><!-- /.navbar-collapse -->
 

</nav>

	<div  class=" header background-color">
		<div >
			<div class="container">
				<div class="row vertical-align"> 

					<div class="col-md-4" style="padding:15px;">

						{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
						
						<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="80" height="80" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
						{/if}
						{if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
						
						<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" width="80" height="80" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
						{elseif $displayPageHeaderTitle}
						{$displayPageHeaderTitle}
						{elseif $alternatePageHeader}
						{$alternatePageHeader}
						{elseif $siteTitle}

						{$siteTitle}
						{else}
						{$applicationName}
						{/if}
					</div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-10">


								<form id="simpleSearchForm"  class="input-group" action="{url page="search" op="search"}">

									<div class="input-group-btn search-panel">
										{capture assign="filterInput"}{call_hook name="Templates::Search::SearchResults::FilterInput" filterName="simpleQuery" filterValue="" size=15}{/capture}

										<select id="searchField" name="searchField" class="selectpicker form-search	 form-control">
											{html_options_translate options=$articleSearchByOptions}
										</select>

									</div>
									{if empty($filterInput)}
									<input type="text" class="form-control form-search" placeholder="Search" id="simpleQuery" name="simpleQuery">

									{else}
									{$filterInput}
									{/if}
									<span class="input-group-btn">
										<button class="btn btn-default form-search" type="submit">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>

								</form>	
							</div>

						</div>
						<div class="row">
							<h3 style="display:inline;"><small>{translate key="navigation.browse"}</small></h3>
							<ul class="list-inline " style="display:inline;">
								<li><a href="{url page="issue" op="archive"}" class="btn browse"><small>{translate key="navigation.browseByIssue"}</small></a></li>
								<li><a href="{url page="search" op="authors"}" class="btn browse"><small>{translate key="navigation.browseByAuthor"}</small></a></li>
								<li><a href="{url page="search" op="titles"}" class="btn browse"><small>{translate key="navigation.browseByTitle"}</small></a></li>
								{call_hook name="Plugins::Blocks::Navigation::BrowseBy"}
								
							</ul>

						</div>	


					</div>	
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
	</div>


 </div><!-- /.container-fluid -->
<!-- <div id="navbar">
	<ul class="menu">
		<li id="home"><a href="{url page="index"}">{translate key="navigation.home"}123</a></li>
		<li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>

		{if $isUserLoggedIn}
			<li id="userHome"><a href="{url journal="index" page="user"}">{translate key="navigation.userHome"}</a></li>
		{else}
			<li id="login"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
			{if !$hideRegisterLink}
				<li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
			{/if}
		{/if}{* $isUserLoggedIn *}

		{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="search" op="categories"}">{translate key="navigation.categories"}</a></li>
		{/if}{* $categoriesEnabled *}

		{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="search"><a href="{url page="search"}">{translate key="navigation.search"}</a></li>
		{/if}

		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="current"><a href="{url page="issue" op="current"}">{translate key="navigation.current"}</a></li>
			<li id="archives"><a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a></li>
		{/if}

		{if $enableAnnouncements}
			<li id="announcements"><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
		{/if}{* enableAnnouncements *}

		{call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}

		{foreach from=$navMenuItems item=navItem key=navItemKey}
			{if $navItem.url != '' && $navItem.name != ''}
				<li class="navItem" id="navItem-{$navItemKey|escape}"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
	</ul>
</div>






 -->

 