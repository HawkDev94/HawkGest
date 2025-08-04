<cfcomponent displayName="orders" output="false">

  <cffunction name="getOrders" access="remote" returnType="array" output="false">

    <cfquery name="aoOrders" returntype="array">
      SELECT o.id as id_order
        ,concat(c.name, " ", c.surname) as client_name
        ,o.date_insert as date_order
        ,c.company_name as company_name
      FROM orders as o
        INNER JOIN customers as c on c.id = o.id_customer
      order by o.date_insert desc  
    </cfquery>
       
    <cfreturn aoOrders>
  </cffunction>

</cfcomponent>
