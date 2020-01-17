<?xml version="1.0" encoding="UTF-8"?>
<sld:UserStyle xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld"
               xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
    <sld:Name>Default Styler</sld:Name>
    <sld:FeatureTypeStyle>
        <sld:Name>name</sld:Name>
        <sld:Rule>
            <sld:Name>town</sld:Name>
            <ogc:Filter>
                <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>place</ogc:PropertyName>
                    <ogc:Literal>town</ogc:Literal>
                </ogc:PropertyIsEqualTo>
            </ogc:Filter>
            <sld:MaxScaleDenominator>100000.0</sld:MaxScaleDenominator>
            <sld:TextSymbolizer>
                <sld:Label>
                    <ogc:PropertyName>name</ogc:PropertyName>
                </sld:Label>
                <sld:Font>
                    <sld:CssParameter name="font-family">Arial</sld:CssParameter>
                    <sld:CssParameter name="font-size">10</sld:CssParameter>
                    <sld:CssParameter name="font-style">normal</sld:CssParameter>
                    <sld:CssParameter name="font-weight">bold</sld:CssParameter>
                </sld:Font>
                <sld:Halo>
                    <sld:Radius>1</sld:Radius>
                    <sld:Fill>
                        <sld:CssParameter name="fill">#ffffff</sld:CssParameter>
                    </sld:Fill>
                </sld:Halo>
                <sld:Fill/>
            </sld:TextSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>city</sld:Name>
            <ogc:Filter>
                <ogc:And>
                    <ogc:PropertyIsEqualTo>
                        <ogc:PropertyName>place</ogc:PropertyName>
                        <ogc:Literal>city</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:Not>
                        <ogc:And>
                            <ogc:PropertyIsLike escape='\' singleChar='_' wildCard='%'>
                                <ogc:PropertyName>name</ogc:PropertyName>
                                <ogc:Literal>%市</ogc:Literal>
                            </ogc:PropertyIsLike>
                            <ogc:PropertyIsNull>
                                <ogc:PropertyName>admin_level</ogc:PropertyName>
                            </ogc:PropertyIsNull>
                        </ogc:And>
                    </ogc:Not>
                </ogc:And>
            </ogc:Filter>
            <sld:MinScaleDenominator>100000.0</sld:MinScaleDenominator>
            <sld:MaxScaleDenominator>5000000.0</sld:MaxScaleDenominator>
            <sld:TextSymbolizer>
                <sld:Label>
                    <ogc:PropertyName>name</ogc:PropertyName>
                </sld:Label>
                <sld:Font>
                    <sld:CssParameter name="font-family">Arial</sld:CssParameter>
                    <sld:CssParameter name="font-size">10</sld:CssParameter>
                    <sld:CssParameter name="font-style">normal</sld:CssParameter>
                    <sld:CssParameter name="font-weight">bold</sld:CssParameter>
                </sld:Font>
                <sld:Halo>
                    <sld:Radius>1</sld:Radius>
                    <sld:Fill>
                        <sld:CssParameter name="fill">#ffffff</sld:CssParameter>
                    </sld:Fill>
                </sld:Halo>
                <sld:Fill/>
            </sld:TextSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>city</sld:Name>
            <ogc:Filter>
                <ogc:And>
                    <ogc:PropertyIsEqualTo>
                        <ogc:PropertyName>place</ogc:PropertyName>
                        <ogc:Literal>city</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsLike escape='\' singleChar='_' wildCard='%'>
                        <ogc:PropertyName>name</ogc:PropertyName>
                        <ogc:Literal>%市</ogc:Literal>
                    </ogc:PropertyIsLike>
                    <ogc:PropertyIsNull>
                        <ogc:PropertyName>admin_level</ogc:PropertyName>
                    </ogc:PropertyIsNull>
                </ogc:And>
            </ogc:Filter>
            <sld:MinScaleDenominator>1000000.0</sld:MinScaleDenominator>
            <sld:MaxScaleDenominator>10000000.0</sld:MaxScaleDenominator>
            <sld:TextSymbolizer>
                <sld:Label>
                    <ogc:PropertyName>name</ogc:PropertyName>
                </sld:Label>
                <sld:Font>
                    <sld:CssParameter name="font-family">Arial</sld:CssParameter>
                    <sld:CssParameter name="font-size">10</sld:CssParameter>
                    <sld:CssParameter name="font-style">normal</sld:CssParameter>
                    <sld:CssParameter name="font-weight">bold</sld:CssParameter>
                </sld:Font>
                <sld:Halo>
                    <sld:Radius>1</sld:Radius>
                    <sld:Fill>
                        <sld:CssParameter name="fill">#ffffff</sld:CssParameter>
                    </sld:Fill>
                </sld:Halo>
                <sld:Fill/>
            </sld:TextSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>state</sld:Name>
            <ogc:Filter>
                <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>place</ogc:PropertyName>
                    <ogc:Literal>state</ogc:Literal>
                </ogc:PropertyIsEqualTo>
            </ogc:Filter>
            <sld:MinScaleDenominator>10000000.0</sld:MinScaleDenominator>
            <sld:MaxScaleDenominator>35000000.0</sld:MaxScaleDenominator>
            <sld:TextSymbolizer>
                <sld:Label>
                    <ogc:PropertyName>name</ogc:PropertyName>
                </sld:Label>
                <sld:Font>
                    <sld:CssParameter name="font-family">Arial</sld:CssParameter>
                    <sld:CssParameter name="font-size">10</sld:CssParameter>
                    <sld:CssParameter name="font-style">normal</sld:CssParameter>
                    <sld:CssParameter name="font-weight">bold</sld:CssParameter>
                </sld:Font>
                <sld:Halo>
                    <sld:Radius>1</sld:Radius>
                    <sld:Fill>
                        <sld:CssParameter name="fill">#ffffff</sld:CssParameter>
                    </sld:Fill>
                </sld:Halo>
                <sld:Fill/>
            </sld:TextSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>country</sld:Name>
            <ogc:Filter>
                <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>place</ogc:PropertyName>
                    <ogc:Literal>country</ogc:Literal>
                </ogc:PropertyIsEqualTo>
            </ogc:Filter>
            <sld:MinScaleDenominator>35000000.0</sld:MinScaleDenominator>
            <sld:TextSymbolizer>
                <sld:Label>
                    <ogc:PropertyName>name</ogc:PropertyName>
                </sld:Label>
                <sld:Font>
                    <sld:CssParameter name="font-family">Arial</sld:CssParameter>
                    <sld:CssParameter name="font-size">10</sld:CssParameter>
                    <sld:CssParameter name="font-style">normal</sld:CssParameter>
                    <sld:CssParameter name="font-weight">bold</sld:CssParameter>
                </sld:Font>
                <sld:Halo>
                    <sld:Radius>1</sld:Radius>
                    <sld:Fill>
                        <sld:CssParameter name="fill">#ffffff</sld:CssParameter>
                    </sld:Fill>
                </sld:Halo>
                <sld:Fill/>
            </sld:TextSymbolizer>
        </sld:Rule>
    </sld:FeatureTypeStyle>
</sld:UserStyle>