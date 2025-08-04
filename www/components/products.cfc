<cfcomponent displayName="products" output="false">

  <cffunction name="getProducts" access="remote" returnType="array" output="false">
    <cfargument name="pIdProducts" default="-1">

    <cfquery name="aoProducts" returntype="array">
      SELECT *
      FROM products
      where 0=0
      <cfif Arguments.pIdProducts NEQ -1>
        and id = <cfqueryparam cfsqltype="cf_sql_integer" value="#Arguments.pIdProducts#">
      </cfif>
    </cfquery>
       
    <cfreturn aoProducts>
  </cffunction>

  <cffunction name="getProductsDetail" access="remote" returnType="query" output="false">
    <cfargument name="pIdProducts" default="-1">

    <cfquery name="rsProductsDetail">
      select p.id as id_product
      , p.name
          , p.description
          , wt.works_types
          , IFNULL(m.material,'-') as material
          , IFNULL(t.thickness,'-') AS thickness
          ,t.id as id_thickness
      FROM products as p
        inner join products_work_phase as pwp on p.id = pwp.id_product
        inner join works_types as wt on wt.id = pwp.id_work_type
        left join thickness as t on t.id = p.id_thickness
        left join materials as m on m.id = t.id_material
      where 0=0
      <cfif Arguments.pIdProducts NEQ -1>
        and p.id = <cfqueryparam cfsqltype="cf_sql_integer" value="#Arguments.pIdProducts#">
      </cfif>
    </cfquery>
       
    <cfreturn rsProductsDetail>
  </cffunction>

  <cffunction name="changeThickness" access="remote" returntype="any" output="true">
    <cfargument name="pIdProduct" default="-1">
    <cfargument name="pIdThickness" default="-1">

    <cfquery>
      UPDATE products
      SET id_thickness = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.pIdThickness#">
      WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.pIdProduct#">
    </cfquery>
       
    <cfreturn true>
  </cffunction>

</cfcomponent>
