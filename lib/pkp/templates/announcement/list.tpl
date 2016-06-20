{**
 * lib/pkp/templates/announcement/list.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcements without site header or footer.
 *
 *}




 

{counter start=1 skip=1 assign="count"}
{iterate from=announcements item=announcement}
	{if !$numAnnouncementsHomepage || $count <= $numAnnouncementsHomepage}
		 <div class="col-md-6">
		{if $announcement->getTypeId()}
			<h4 class="text-capitalize">{$announcement->getAnnouncementTypeName()|escape}: {$announcement->getLocalizedTitle()|escape}</h4>
		{else}
			 <h4 class="text-capitalize">{$announcement->getLocalizedTitle()|escape}</h4>
		{/if}
			
	
		
			<p>{$announcement->getLocalizedDescriptionShort()|nl2br}</p>	
	
			<em>{translate key="announcement.posted"}: {$announcement->getDatePosted()}</em>
			{if $announcement->getLocalizedDescription() != null}
	
				<a href="{url page="announcement" op="view" path=$announcement->getId()}" class="btn btn-link">{translate key="announcement.viewLink"}</a>
			{/if}
		</div>
	{/if}

		
	{counter}
{/iterate}
{if $announcements->wasEmpty()}
	 <div class="col-md-6">
		{translate key="announcement.noneExist"}
</div>
{/if}

