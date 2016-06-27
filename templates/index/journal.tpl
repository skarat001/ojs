{**
	* templates/index/journal.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Journal index page.
	*
	*}
	{strip}
	{assign var="pageTitleTranslated" value=$siteTitle}
	{include file="common/header.tpl"}
	{/strip}

	<div  class="panel panel-default">
		<div class="panel-body">
			{if $journalDescription}
			<div id="journalDescription">{$journalDescription}</div>
			{/if}

			{call_hook name="Templates::Index::journal"}

			{if $homepageImage}
			<br />
			<div id="homepageImage">

				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="1"  class="active"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
						<center><img src="{$baseUrl}/public/image/01461078546logo_UI-Horizontal_frameblack.png" class="img tinggigambar" alt="img1" style="height:auto;max-height:200px;width:auto"></center>
						</div>

						<div class="item">
							<img src="{$baseUrl}/public/image/gamma-intro.PNG" class="img tinggigambar" alt="img2" style="height:auto;max-height:200px;width:auto">
						</div>

						<div class="item">
							<img src="{$baseUrl}/public/image/scopus.png" class="img tinggigambar" alt="Flower" style="height:auto;max-height:200px;width:auto">
						</div>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>

			</div>
			{/if}

			{if $additionalHomeContent}
			<br />
			<div id="additionalHomeContent" >{$additionalHomeContent}</div>
			{/if}

			{if $enableAnnouncementsHomepage}

			{* Display announcements *}
		</div>
	</div>
	{if $issue && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
	{* Display the table of contents or cover page of the current issue. *}
	<div  class="panel panel-default">
		<div class="panel-body">
			<h3><i class="fa fa-book" ></i>{$issue->getIssueIdentification()|strip_unsafe_html|nl2br}</h3>
			<hr>

			{include file="issue/view.tpl"}

		</div>
	</div>
	{/if}
	<div id="announcementsHome" class="panel panel-default">
		<div class="panel-body">
			<h3> 	<i class="fa fa-bullhorn "></i>  {translate key="announcement.announcementsHome"}</h3>
			<hr>
			<div class="row">
				{include file="announcement/list.tpl"}	
			</div>
			<a href="{url page="announcement"}" class="btn btn-link">{translate key="announcement.moreAnnouncements"}</a>
		</div>
	</div>
	{/if}



	{include file="common/footer.tpl"}

