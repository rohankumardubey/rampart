/*
 * Copyright 2004,2005 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package test.interop.whitemesa;

import org.apache.axis2.AxisFault;
import org.apache.ws.commons.om.OMXMLParserWrapper;
import org.apache.ws.commons.soap.SOAPBody;
import org.apache.ws.commons.soap.SOAPEnvelope;
import org.apache.ws.commons.soap.impl.builder.StAXSOAPModelBuilder;
import org.custommonkey.xmlunit.XMLTestCase;

import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamReader;
import java.io.InputStream;

public class WhiteMesaIneterop extends XMLTestCase {

    protected void compareXML(SOAPEnvelope retEnv, String filePath)
            throws AxisFault {

        try {
            if (retEnv != null) {
                SOAPBody body = retEnv.getBody();
                if (!body.hasFault()) {
                    InputStream stream = Thread.currentThread()
                            .getContextClassLoader().getResourceAsStream(
                            filePath);

                    XMLStreamReader parser = XMLInputFactory.newInstance()
                            .createXMLStreamReader(stream);
                    OMXMLParserWrapper builder = new StAXSOAPModelBuilder(
                            parser, null);
                    SOAPEnvelope refEnv = (SOAPEnvelope) builder
                            .getDocumentElement();
                    String refXML = refEnv.toString();
                    String retXML = retEnv.toString();
                    assertXMLEqual(refXML, retXML);
                }
            }
        } catch (Exception e) {
            throw new AxisFault(e);
        }

    }

}