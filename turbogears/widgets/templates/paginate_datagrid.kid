<table xmlns:py="http://purl.org/kid/ns#" id="${name}"
  class="grid" cellpadding="0" cellspacing="1" border="0">
<thead>
  <tr py:if="getattr(tg, 'paginate', False) and tg.paginate.page_count > 1">
    <td align="center" colspan="${len(columns) or None}">
      <a py:strip="not tg.paginate.href_first"
        href="${tg.paginate.href_first}"><span
        class="tgp_button">&lt;&lt;</span></a>
      <a py:strip="not tg.paginate.href_prev"
        href="${tg.paginate.href_prev}"><span
        class="tgp_button">&lt;</span></a>
      &#160;<span py:for="page in tg.paginate.pages" py:strip="True">
      <a py:strip="page == tg.paginate.current_page"
        href="${tg.paginate.get_href(page)}"><span
        class="tgp_button" py:content="page"/></a>
      </span>&#160;
      <a py:strip="not tg.paginate.href_next"
        href="${tg.paginate.href_next}"><span
        class="tgp_button">&gt;</span></a>
      <a py:strip="not tg.paginate.href_last"
        href="${tg.paginate.href_last}"><span
        class="tgp_button">&gt;&gt;</span></a>
    </td>
  </tr>
  <tr py:if="columns">
    <th py:for="i, col in enumerate(columns)" class="col_${i}">
      <a py:strip="not getattr(
          tg, 'paginate', False) or not col.get_option('sortable', False)"
        href="${tg.paginate.get_href(1, col.getter.__dict__.get(
          'name', col.name), col.get_option('reverse_order', False))}"
        py:content="col.title"/>
    </th>
  </tr>
</thead>
<tbody>
  <tr py:for="i, row in enumerate(value)" class="${i%2 and 'odd' or 'even'}">
    <td py:for="col in columns" align="${col.get_option('align', None)}"
      py:content="col.get_field(row)"/>
  </tr>
</tbody>
</table>
