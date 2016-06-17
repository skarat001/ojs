{**
	* templates/search/search.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* A unified search interface.
	*}
	{strip}
	{assign var="pageTitle" value="navigation.search"}
	{include file="common/header.tpl"}
	{/strip}


	<script type="text/javascript">
		$(function() {ldelim}
			// Attach the form handler.
			$('#searchForm').pkpHandler('$.pkp.pages.search.SearchFormHandler');
			{rdelim});
	</script>

	<form id="searchForm" action="{url op="search"}" class="form-horizontal">
		<div class="form-group">
			<label class="col-md-3 control-label">
				<label for="query">{translate key="search.searchAllCategories"}</label>
			</label>
			<div class="col-md-5">
				{capture assign="queryFilter"}{call_hook name="Templates::Search::SearchResults::FilterInput" filterName="query" filterValue=$query}{/capture}
				{if empty($queryFilter)}
				<input type="text" id="query" name="query" size="40" maxlength="255" value="{$query|escape}" class="form-control" />
				{else}
				{$queryFilter}
				{/if}
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-5 col-md-offset-3">
				<input type="submit" value="{translate key="common.search"}" class="btn btn-default" />
			</div>
		</div>

		{if $siteSearch}
		<div class="form-group">
			<label class="col-md-3 control-label">
				<label for="searchJournal">{translate key="search.withinJournal"}</label>
			</label>
			<div class="col-md-5">
				<select name="searchJournal" id="searchJournal" class="selectMenu">{html_options options=$journalOptions selected=$searchJournal}</select>
			</div>
		</div>

		{/if}
		{if $hasActiveFilters}

		<h4>{translate key="search.activeFilters"}</h4>

		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="authors" filterValue=$authors key="search.author"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="title" filterValue=$title key="article.title"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="abstract" filterValue=$abstract key="search.abstract"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="galleyFullText" filterValue=$galleyFullText key="search.fullText"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="suppFiles" filterValue=$suppFiles key="article.suppFiles"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterType="date" filterName="dateFrom" filterValue=$dateFrom startYear=$startYear endYear=$endYear key="search.dateFrom"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterType="date" filterName="dateTo" filterValue=$dateTo startYear=$startYear endYear=$endYear key="search.dateTo"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="discipline" filterValue=$discipline key="search.discipline"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="subject" filterValue=$subject key="search.subject"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="type" filterValue=$type key="search.typeMethodApproach"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="coverage" filterValue=$coverage key="search.coverage"}
		{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="indexTerms" filterValue=$indexTerms key="search.indexTermsLong"}
		{/if}


		{if $hasEmptyFilters}
		<div class="panel panel-default">
			<div class="panel-heading" >
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#one"  > <span style="display: block;">	{capture assign="emptyFilters"}</span></a>
				</h4>
			</div>
			<div id="one" class="panel-collapse collapse ">
				<div class="panel-body">


						{if empty($authors) || empty($title) || empty($abstract) || empty($galleyFullText) || empty($suppFiles)}
							
							<h4>{translate key="search.searchCategories"}</h4>

						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="authors" filterValue=$authors key="search.author"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="title" filterValue=$title key="article.title"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="abstract" filterValue=$abstract key="search.abstract"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="galleyFullText" filterValue=$galleyFullText key="search.fullText"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="suppFiles" filterValue=$suppFiles key="article.suppFiles"}
						{/if}
						{if $dateFrom == '--' || $dateTo == '--'}

						<h4>{translate key="search.date"}</h4>

						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterType="date" filterName="dateFrom" filterValue=$dateFrom startYear=$startYear endYear=$endYear key="search.dateFrom"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterType="date" filterName="dateTo" filterValue=$dateTo startYear=$startYear endYear=$endYear key="search.dateTo"}
						{/if}
						{if empty($discipline) || empty($subject) || empty($type) || empty($coverage)}

							<h4>{translate key="search.indexTerms"}</h4>

						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="discipline" filterValue=$discipline key="search.discipline"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="subject" filterValue=$subject key="search.subject"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="type" filterValue=$type key="search.typeMethodApproach"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="coverage" filterValue=$coverage key="search.coverage"}
						{include file="search/searchFilter.tpl" displayIf="emptyFilter" filterName="indexTerms" filterValue=$indexTerms key="search.indexTermsLong"}
						{/if}

					<p><input type="submit" value="{translate key="common.search"}" class="button defaultButton" /></p>
					{/capture}
					{include file="controllers/extrasOnDemand.tpl" id="emptyFilters" moreDetailsText="search.advancedSearchMore" lessDetailsText="search.advancedSearchLess" extraContent=$emptyFilters}





					{/if}

				</div>
			</div>

		</form>



		{call_hook name="Templates::Search::SearchResults::PreResults"}

		{if $currentJournal}
		{assign var=numCols value=3}
		{else}
		{assign var=numCols value=4}
		{/if}


			

<!-- 				{if !$currentJournal}


				<h4 class="text-capitalize"><strong>{translate key="journal.journal"}
</strong></h4>
				{/if}
				
				<h4 class="text-capitalize">{translate key="issue.issue"}
</h4>
<h4 class="text-capitalize"><strong>
				{translate key="article.title"}
</strong></h4> -->


			{iterate from=results item=result}
					<div class="col-md-6">
		<div class="panel panel-default">
<div class="panel-heading">
		<div  class="row container">
			{assign var=publishedArticle value=$result.publishedArticle}
			{assign var=article value=$result.article}
			{assign var=issue value=$result.issue}
			{assign var=issueAvailable value=$result.issueAvailable}
			{assign var=journal value=$result.journal}
			{assign var=section value=$result.section}
				{if !$currentJournal}
				
				<a href="{url journal=$journal->getPath()}">{$journal->getLocalizedTitle()|escape}</a>
				{/if}

				<a href="{url journal=$journal->getPath() page="issue" op="view" path=$issue->getBestIssueId($journal)}"><h4 class="text-capitalize">{$issue->getIssueIdentification()|escape}</h4></a>

				<h4 class="text-capitalize"><strong>
				{$article->getLocalizedTitle()|strip_unsafe_html}
</strong>
</h4>
{foreach from=$article->getAuthors() item=authorItem name=authorList}
					<p>{$authorItem->getFullName()|escape}{if !$smarty.foreach.authorList.last},{/if}
</p>
					{/foreach}

					{if $publishedArticle->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN|| $issueAvailable}
					{assign var=hasAccess value=1}
					{else}
					{assign var=hasAccess value=0}
					{/if}
					{if $publishedArticle->getLocalizedAbstract() != ""}
					{assign var=hasAbstract value=1}
					{else}
					{assign var=hasAbstract value=0}
					{/if}
					{if !$hasAccess || $hasAbstract}
					<a href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestArticleId($journal)}" class="file">
						<strong>
						{if !$hasAbstract}
						{translate key="article.details"}
						{else}
						{translate key="article.abstract"}
						{/if}
						</strong>
					</a>
					<br>
					{/if}
					{if $hasAccess}
					{foreach from=$publishedArticle->getGalleys() item=galley name=galleyList}
					<br>
				<i class="fa fa-download" ></i><a href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestArticleId($journal)|to_array:$galley->getBestGalleyId($journal)}" class="file">{$galley->getGalleyLabel()|escape}</a>
					{/foreach}
					{/if}
					{call_hook name="Templates::Search::SearchResults::AdditionalArticleLinks" articleId=$publishedArticle->getId()}
			

					
			{call_hook name="Templates::Search::SearchResults::AdditionalArticleInfo" articleId=$publishedArticle->getId() numCols=$numCols|escape}
</div>
</div>
</div>
</div>
			{/iterate}
			{if $results->wasEmpty()}

					{if $error}
					{$error|escape}
					{else}
					{translate key="search.noResults"}
					{/if}
			
			{else}
				{page_info iterator=$results}
				
				{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText suppFiles=$suppFiles discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
			
			{/if}
		

		{capture assign="syntaxInstructions"}{call_hook name="Templates::Search::SearchResults::SyntaxInstructions"}{/capture}
		{if empty($syntaxInstructions)}
		{translate key="search.syntaxInstructions"}
		{else}
		{* Must be properly escaped in the controller as we potentially get HTML here! *}
		{$syntaxInstructions}
		{/if}


		{include file="common/footer.tpl"}

