
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 679 and 679+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'white' or i_color = 'hot') and 
        (i_units = 'Bunch' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'coral' or i_color = 'cornsilk') and
        (i_units = 'Gross' or i_units = 'Dram') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'azure' or i_color = 'puff') and
        (i_units = 'Box' or i_units = 'Tsp') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'black' or i_color = 'magenta') and
        (i_units = 'Dozen' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tomato' or i_color = 'lemon') and 
        (i_units = 'Gram' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'cyan' or i_color = 'plum') and
        (i_units = 'Case' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'medium' or i_color = 'beige') and
        (i_units = 'Carton' or i_units = 'Oz') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'grey') and
        (i_units = 'Pound' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;

;
