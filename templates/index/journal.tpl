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
<div id="homepageImage"><img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" width="{$homepageImage.width|escape}" height="{$homepageImage.height|escape}" {if $homepageImageAltText != ''}alt="{$homepageImageAltText|escape}"{else}alt="{translate key="common.journalHomepageImage.altText"}"{/if} /></div>
{/if}

{if $additionalHomeContent}
<br />
<div id="additionalHomeContent" >{$additionalHomeContent}</div>
{/if}

{if $enableAnnouncementsHomepage}

	{* Display announcements *}
</div>
</div>
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

{include file="common/footer.tpl"}

