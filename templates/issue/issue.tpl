{**
 * templates/issue/issue.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Issue
 *
 *}
{foreach name=sections from=$publishedArticles item=section key=sectionId}
{if $section.title}<h4 class="tocSectionTitle">{$section.title|escape}</h4>{/if}

{foreach from=$section.articles item=article}
	{assign var=articlePath value=$article->getBestArticleId($currentJournal)}
	{assign var=articleId value=$article->getId()}

	{if $article->getLocalizedFileName() && $article->getLocalizedShowCoverPage() && !$article->getHideCoverPageToc($locale)}
		{assign var=showCoverPage value=true}
	{else}
		{assign var=showCoverPage value=false}
	{/if}

	{if $article->getLocalizedAbstract() == ""}
		{assign var=hasAbstract value=0}
	{else}
		{assign var=hasAbstract value=1}
	{/if}

	{if (!$subscriptionRequired || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || $subscribedUser || $subscribedDomain || ($subscriptionExpiryPartial && $articleExpiryPartial.$articleId))}
		{assign var=hasAccess value=1}
	{else}
		{assign var=hasAccess value=0}
	{/if}

<div class="col-sm-4">

		{if $showCoverPage}
			<div class="tocCoverImage">
				{if !$hasAccess || $hasAbstract}<a href="{url page="article" op="view" path=$articlePath}" class="file">{/if}
				<img src="{$coverPagePath|escape}{$article->getLocalizedFileName()|escape}"{if $article->getCoverPageAltText($locale) != ''} alt="{$article->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if}/>
				{if !$hasAccess || $hasAbstract}</a>{/if}
			</div>
		{/if}


	{call_hook name="Templates::Issue::Issue::ArticleCoverImage"}


<div class="panel panel-default">
<div class="panel-body">
<div class="row">
<center>
<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="50" height="50" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
</center>
</div>
		<div  class="row">
			<center>{if !$hasAccess || $hasAbstract}
				<a href="{url page="article" op="view" path=$articlePath}" class="btn btn-link"><h4 class="text-capitalize"><strong>{$article->getLocalizedTitle()|strip_unsafe_html}</strong></h4></a>
			{else}
				{$article->getLocalizedTitle()|strip_unsafe_html}
			{/if}
			</center>
		</div>
		<div class="tocAuthors" class="row">
			<center>{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
				{foreach from=$article->getAuthors() item=author name=authorList}
					<p class="text-capitalize">{$author->getFullName()|escape}{if !$smarty.foreach.authorList.last},{/if}</p>
				{/foreach}
			{else}
				&nbsp;
			{/if}
			</center>
		</div>



		<div class="tocGalleys">
			{if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
				{foreach from=$article->getGalleys() item=galley name=galleyList}
				
				<i class="fa fa-download" ></i>
					<a href="{url page="article" op="view" path=$articlePath|to_array:$galley->getBestGalleyId($currentJournal)}" {if $galley->getRemoteURL()}target="_blank" {/if}class="file">{$galley->getGalleyLabel()|escape}</a>
					{if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
						{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || !$galley->isPdfGalley()}
							<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />
						{else}
							<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
						{/if}
					{/if}
				{/foreach}
				{if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
					{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}
						<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />
					{else}
						<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
					{/if}
				{/if}
			{/if}
		</div>
		<div class="tocPages">
			<!-- {$article->getPages()|escape} -->
		</div>

		</div>
		</div>
</div>
{call_hook name="Templates::Issue::Issue::Article"}
{/foreach}

{if !$smarty.foreach.sections.last}
<div class="separator"></div>
{/if}
{/foreach}

