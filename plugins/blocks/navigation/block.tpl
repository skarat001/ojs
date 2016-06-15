<!-- {**
	* plugins/blocks/navigation/block.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Common site sidebar menu -- navigation links.
	*
	*}
	{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
	<div class="block" id="sidebarNavigation">
		<span class="blockTitle">{translate key="plugins.block.navigation.journalContent"}</span>

		<form id="simpleSearchForm" action="{url page="search" op="search"}">

			<div class="input-group-btn search-panel">
				{capture assign="filterInput"}{call_hook name="Templates::Search::SearchResults::FilterInput" filterName="simpleQuery" filterValue="" size=15}{/capture}
				
				<select id="searchField" name="searchField" class="btn btn-default dropdown-toggle form-search">
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
		
				

				
				{if $currentJournal}
				<span class="blockSubtitle">{translate key="navigation.browse"}</span>
				<ul>
					<li><a href="{url page="issue" op="archive"}">{translate key="navigation.browseByIssue"}</a></li>
					<li><a href="{url page="search" op="authors"}">{translate key="navigation.browseByAuthor"}</a></li>
					<li><a href="{url page="search" op="titles"}">{translate key="navigation.browseByTitle"}</a></li>
					{call_hook name="Plugins::Blocks::Navigation::BrowseBy"}
					{if $hasOtherJournals}
					<li><a href="{url journal="index"}">{translate key="navigation.otherJournals"}</a></li>
					{if $siteCategoriesEnabled}<li><a href="{url journal="index" page="search" op="categories"}">{translate key="navigation.categories"}</a></li>{/if}
					{/if}
				</ul>
				{/if}
			</div>
			{/if}
 -->