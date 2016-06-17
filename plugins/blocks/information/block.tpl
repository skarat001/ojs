{**
 * plugins/blocks/information/block.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- information links.
 *
 *}
{if !empty($forReaders) || !empty($forAuthors) || !empty($forLibrarians)}


<div class="panel panel-default" id="sidebarInformation">
	 <div class="panel-heading">
	<span class="blockTitle"><i class="fa fa-info fa-1x" > </i> {translate key="plugins.block.information.link"}</span>
	</div>
	 <div class="panel-body">
	<ul>
		{if !empty($forReaders)}<li><a href="{url page="information" op="readers"}">{translate key="navigation.infoForReaders"}</a></li>{/if}
		{if !empty($forAuthors)}<li><a href="{url page="information" op="authors"}">{translate key="navigation.infoForAuthors"}</a></li>{/if}
		{if !empty($forLibrarians)}<li><a href="{url page="information" op="librarians"}">{translate key="navigation.infoForLibrarians"}</a></li>{/if}
	</ul>
	</div>
</div>
{/if}
