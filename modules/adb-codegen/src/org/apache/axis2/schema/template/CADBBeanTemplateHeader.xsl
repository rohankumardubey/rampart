<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

     <!-- cater for the multiple classes - wrappped mode -->
    <xsl:template match="/beans">
        <xsl:variable name="name"><xsl:value-of select="@name"/></xsl:variable>
        <xsl:variable name="axis2_name">axi2_<xsl:value-of select="@name"/></xsl:variable>
        <xsl:variable name="caps_axis2_name">AXIS2_<xsl:value-of select="@caps-name"/></xsl:variable>
        #ifndef <xsl:value-of select="$caps_axis2_name"/>_H
        #define <xsl:value-of select="$caps_axis2_name"/>_H

        /**
        * <xsl:value-of select="$axis2_name"/>.h
        *
        * This file was auto-generated from WSDL
        * by the Apache Axis2 Java version: #axisVersion# #today#
        */
        <xsl:for-each select="property">
          <xsl:if test="@ours">
          <xsl:variable name="propertyType"><xsl:if test="@ours">axis2_</xsl:if><xsl:value-of select="@type"></xsl:value-of></xsl:variable>
          #include "<xsl:value-of select="$propertyType"/>.h"
          </xsl:if>
        </xsl:for-each>

        #include &lt;stdio.h&gt;
        #include &lt;axiom.h&gt;
        #include &lt;axis2_util.h&gt;
        #include &lt;axiom_soap.h&gt;
        #include &lt;axis2_client.h&gt;

        #ifdef __cplusplus
        extern "C"
        {
        #endif

        #define AXIS2_DEFAULT_DIGIT_LIMIT 128

        /**
        *  <xsl:value-of select="$axis2_name"/> wrapped bean classes ( structure for C )
        */

        <xsl:apply-templates/>


        #ifdef __cplusplus
        }
        #endif

        #endif /* <xsl:value-of select="$caps_axis2_name"/>_H */
    </xsl:template>

    <!--cater for the multiple classes - unwrappped mode -->
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="bean">
        <xsl:variable name="name"><xsl:value-of select="@name"/></xsl:variable>
        <xsl:variable name="axis2_name">axis2_<xsl:value-of select="@name"/></xsl:variable>
        <xsl:variable name="caps_axis2_name">AXIS2_<xsl:value-of select="@caps-name"/></xsl:variable>

        #ifndef <xsl:value-of select="$caps_axis2_name"/>_H
        #define <xsl:value-of select="$caps_axis2_name"/>_H

        /**
        * <xsl:value-of select="$axis2_name"/>.h
        *
        * This file was auto-generated from WSDL
        * by the Apache Axis2 version: #axisVersion# #today#
        */

        <xsl:for-each select="property">
          <xsl:if test="@ours">
          <xsl:variable name="propertyType"><xsl:if test="@ours">axis2_</xsl:if><xsl:value-of select="@type"></xsl:value-of></xsl:variable>
          #include "<xsl:value-of select="$propertyType"/>.h"
          </xsl:if>
        </xsl:for-each>

        #include &lt;stdio.h&gt;
        #include &lt;axiom.h&gt;
        #include &lt;axis2_util.h&gt;
        #include &lt;axiom_soap.h&gt;
        #include &lt;axis2_client.h&gt;

        #ifdef __cplusplus
        extern "C"
        {
        #endif

        #define AXIS2_DEFAULT_DIGIT_LIMIT 64
        /**
        *  <xsl:value-of select="$axis2_name"/> bean class
        */
        typedef struct <xsl:value-of select="$axis2_name"/><xsl:text> </xsl:text><xsl:value-of select="$axis2_name"/>_t;
        typedef struct <xsl:value-of select="$axis2_name"/>_ops<xsl:text> </xsl:text><xsl:value-of select="$axis2_name"/>_ops_t;

        struct <xsl:value-of select="$axis2_name"/>_ops
        {
            axis2_status_t (AXIS2_CALL*
            free )(
                <xsl:value-of select="$axis2_name"/>_t*<xsl:text> </xsl:text><xsl:value-of select="$name"/>,
                const axis2_env_t *env);

            axis2_qname_t* (AXIS2_CALL*
            get_qname )(
                <xsl:value-of select="$axis2_name"/>_t*<xsl:text> </xsl:text><xsl:value-of select="$name"/>,
                const axis2_env_t *env);

            axis2_status_t (AXIS2_CALL*
            parse_om )(
                <xsl:value-of select="$axis2_name"/>_t*<xsl:text> </xsl:text><xsl:value-of select="$name"/>,
                const axis2_env_t *env,
                axiom_node_t* <xsl:value-of select="$name"/>_om_node);

            axiom_node_t* (AXIS2_CALL*
            build_om )(
                <xsl:value-of select="$axis2_name"/>_t*<xsl:text> </xsl:text><xsl:value-of select="$name"/>,
                const axis2_env_t *env, axiom_node_t* parent,
                axiom_namespace_t* xsi, axiom_namespace_t* xsd);

            <xsl:for-each select="property">
                <xsl:variable name="propertyType"><xsl:if test="@ours">axis2_</xsl:if><xsl:choose><xsl:when test="@type='org.apache.axiom.om.OMElement'">axiom_node_t*</xsl:when><xsl:otherwise><xsl:value-of select="@type"></xsl:value-of></xsl:otherwise></xsl:choose><xsl:if test="@ours">_t*</xsl:if><xsl:if test="@isarray">*</xsl:if> </xsl:variable>
                <xsl:variable name="propertyName"><xsl:value-of select="@name"></xsl:value-of></xsl:variable>
                <xsl:variable name="javaName"><xsl:value-of select="@javaname"></xsl:value-of></xsl:variable>

                /**
                * Auto generated getter method
                * @return <xsl:value-of select="$propertyName"/>
                */
                <xsl:value-of select="$propertyType"/> (AXIS2_CALL*
                get_<xsl:value-of select="$propertyName"/>)(
                        <xsl:value-of select="$axis2_name"/>_t*<xsl:text> </xsl:text><xsl:value-of select="$name"/>,
                        const axis2_env_t *env<xsl:if test="@isarray">, int* length</xsl:if>);

                /**
                * Auto generated setter method
                * @param param <xsl:value-of select="$propertyName"/>
                */
                axis2_status_t (AXIS2_CALL*
                set_<xsl:value-of select="$propertyName"/>)(
                        <xsl:value-of select="$axis2_name"/>_t*<xsl:text> </xsl:text><xsl:value-of select="$name"/>,
                        const axis2_env_t *env,
                        <xsl:value-of select="$propertyType"/> param<xsl:if test="@isarray">, int length</xsl:if>);


            </xsl:for-each>
        };
        struct <xsl:value-of select="$axis2_name"/>
        {
            <xsl:value-of select="$axis2_name"/>_ops_t* ops;
        };

        AXIS2_EXTERN <xsl:value-of select="$axis2_name"/>_t* AXIS2_CALL
        <xsl:value-of select="$axis2_name"/>_create(
            const axis2_env_t *env );


        #define <xsl:value-of select="$caps_axis2_name"/>_FREE(<xsl:value-of select="$name"/>, env) \
             ((<xsl:value-of select="$name"/>)->ops->free(<xsl:value-of select="$name"/>, env))
        #define <xsl:value-of select="$caps_axis2_name"/>_GET_QNAME(<xsl:value-of select="$name"/>, env) \
             ((<xsl:value-of select="$name"/>)->ops->get_qname(<xsl:value-of select="$name"/>, env))
        #define <xsl:value-of select="$caps_axis2_name"/>_PARSE_OM(<xsl:value-of select="$name"/>, env, node) \
             ((<xsl:value-of select="$name"/>)->ops->parse_om(<xsl:value-of select="$name"/>, env, node))
        #define <xsl:value-of select="$caps_axis2_name"/>_BUILD_OM(<xsl:value-of select="$name"/>, env, parent, xsi, xsd) \
             ((<xsl:value-of select="$name"/>)->ops->build_om(<xsl:value-of select="$name"/>, env, parent, xsi, xsd))

        <xsl:for-each select="property">
            <xsl:variable name="propertyType"><xsl:value-of select="@type"></xsl:value-of></xsl:variable>
            <xsl:variable name="propertyName"><xsl:value-of select="@name"></xsl:value-of></xsl:variable>
            <xsl:variable name="capspropertyName"><xsl:value-of select="@caps-name"></xsl:value-of></xsl:variable>
            <xsl:variable name="javaName"><xsl:value-of select="@javaname"></xsl:value-of></xsl:variable>

            #define <xsl:value-of select="$caps_axis2_name"/>_GET_<xsl:value-of select="$capspropertyName"/>(<xsl:value-of select="$name"/>, env<xsl:if test="@isarray">, length</xsl:if>) \
                 ((<xsl:value-of select="$name"/>)->ops->get_<xsl:value-of select="$propertyName"/>(<xsl:value-of select="$name"/>, env<xsl:if test="@isarray">, length</xsl:if>))

            #define <xsl:value-of select="$caps_axis2_name"/>_SET_<xsl:value-of select="$capspropertyName"/>(<xsl:value-of select="$name"/>, env, param<xsl:if test="@isarray">, length</xsl:if>) \
                 ((<xsl:value-of select="$name"/>)->ops->set_<xsl:value-of select="$propertyName"/>(<xsl:value-of select="$name"/>, env, param<xsl:if test="@isarray">, length</xsl:if>))

        </xsl:for-each>
     #ifdef __cplusplus
     }
     #endif

     #endif /* <xsl:value-of select="$caps_axis2_name"/>_H */
    </xsl:template>
</xsl:stylesheet>
