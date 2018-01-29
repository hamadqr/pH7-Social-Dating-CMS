{if !empty($img_background)}
    {* Set custom profile background (if set by user) *}
    {manual_include 'profile_background.inc.tpl'}
{/if}


<div class="row">
    <div class="col-md-3">
        {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}

        <p><span class="bold">{lang 'I am a:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&match_sex='.$sex) }}">{lang $sex}</a></span></p>
        <div class="break"></div>

        {if !empty($match_sex)}
          <p><span class="bold">{lang 'Looking for a:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code) }}{match_sex_search}">{lang $match_sex}</a></span></p>
          <div class="break"></div>
        {/if}

        <p><span class="bold">{lang 'First name:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&first_name='.$first_name) }}">{first_name}</a></span></p>
        <div class="break"></div>

        {if !empty($middle_name)}
          <p><span class="bold">{lang 'Middle name:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&middle_name='.$middle_name) }}">{middle_name}</a></span></p>
          <div class="break"></div>
        {/if}

        {if !empty($last_name)}
          <p><span class="bold">{lang 'Last name:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&last_name='.$last_name) }}">{last_name}</a></span></p>
          <div class="break"></div>
        {/if}

        {if !empty($age)}
          <p><span class="bold">{lang 'Age:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&age='.$birth_date) }}">{age}</a> <span class="gray">({birth_date_formatted})</span></span></p>
          <div class="break"></div>
        {/if}

        {* Profile's Fields *}
        {each $key => $val in $fields}
            {if $key != 'description' AND $key != 'middleName' AND !empty($val)}
              {{ $val = escape($val, true) }}

              {if $key == 'height'}
                <p><span class="bold">{lang 'Height:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&height='.$val) }}">{{ (new Framework\Math\Measure\Height($val))->display(true) }}</a></span></p>

              {elseif $key == 'weight'}
                <p><span class="bold">{lang 'Weight:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&weight='.$val) }}">{{ (new Framework\Math\Measure\Weight($val))->display(true) }}</a></span></p>

              {elseif $key == 'country'}
                <p><span class="bold">{lang 'Country:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code) }}">{country}</a></span>&nbsp;&nbsp;<img src="{{ $design->getSmallFlagIcon($country_code) }}" title="{country}" alt="{country}" /></p>

              {elseif $key == 'city'}
                <p><span class="bold">{lang 'City/Town:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&city='.$city) }}">{city}</a></span></p>

              {elseif $key == 'state'}
                <p><span class="bold">{lang 'State/Province:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&state='.$state) }}">{state}</a></span></p>

              {elseif $key == 'zipCode'}
                <p><span class="bold">{lang 'Postal Code:'}</span> <span class="italic"><a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&zip_code='.$val) }}">{val}</a></span></p>

              {elseif $key == 'website'}
                <p>{{ $design->favicon($val) }}&nbsp;&nbsp;<span class="bold">{lang 'Site/Blog:'}</span> <span class="italic">{{ $design->urlTag($val) }}</span></p>

              {elseif $key == 'socialNetworkSite'}
                <p>{{ $design->favicon($val) }}&nbsp;&nbsp;<span class="bold">{lang 'Social Profile:'}</span> <span class="italic">{{ $design->urlTag($val) }}</span></p>

              {else}
                {{ $lang_key = strtolower($key) }}

                {if strstr($key, 'url')}
                  <p>{{ $design->favicon($val) }}&nbsp;&nbsp;<span class="bold">{lang $lang_key}</span> <span class="italic">{{ $design->urlTag($val) }}</span></p>
                {else}
                  <p><span class="bold">{lang $lang_key}</span> <span class="italic">{val}</span></p>
                {/if}
              {/if}
              <div class="break"></div>
            {/if}
        {/each}

        {{ $design->likeApi() }}
    </div>

    <div class="col-md-6">
        {if !empty($description)}
            <h2 class="underline center">{lang 'A Little About Me'}</h2>
            <div class="quote italic center s_bMarg">{description}</div>
        {/if}

        <hr class="s_bMarg" />

        <h2 class="underline center">{lang 'Photos & Videos'}</h2>
        {if $is_picture_enabled}
            <div class="content" id="picture">
                <script>
                    var url_picture_block = '{{ $design->url('picture','main','albums',$username) }}';
                    $('#picture').load(url_picture_block + ' #picture_block');
                </script>
            </div>
        {/if}

        {if $is_video_enabled}
            <div class="content" id="video">
                <script>
                    var url_video_block = '{{ $design->url('video','main','albums',$username) }}';
                    $('#video').load(url_video_block + ' #video_block');
                </script>
            </div>
        {/if}

        <hr />

        <div class="center small">
            {if !empty($join_date)}
                {lang 'Join Date:'} <span class="italic">{join_date}</span> &nbsp; | &nbsp;
            {/if}

            {if !empty($last_activity)}
                {lang 'Last Activity:'} <span class="italic">{last_activity}</span> &nbsp; | &nbsp;
            {/if}

            {lang 'Views:'} <span class="italic">{% Framework\Mvc\Model\Statistic::getView($id,'Members') %}</span>
        </div>

        <p class="center">
            {{ $design->like($username, $first_name, $sex) }} | {{ $design->report($id, $username, $first_name, $sex) }}
        </p>
    </div>

    <div class="col-md-3">
        <div class="s_bMarg">
            <h2>{lang 'Location'}</h2>
            {map}
        </div>

        {{ CommentDesignCore::link($id, 'Profile') }}
    </div>
</div>