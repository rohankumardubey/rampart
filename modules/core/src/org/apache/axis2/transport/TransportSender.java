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


package org.apache.axis2.transport;

import org.apache.axis2.AxisFault;
import org.apache.axis2.context.ConfigurationContext;
import org.apache.axis2.context.MessageContext;
import org.apache.axis2.description.TransportOutDescription;
import org.apache.axis2.engine.Handler;

/**
 * This send the SOAP Message to other SOAP nodes and this alone write the SOAP Message to the
 * wire. Out flow must be end with one of this kind.
 */
public interface TransportSender extends Handler {

    /**
     * Clean up
     *
     * @param msgContext
     * @throws org.apache.axis2.AxisFault
     */
    public void cleanup(MessageContext msgContext) throws AxisFault;

    /**
     * Initialize
     *
     * @param confContext
     * @param transportOut
     * @throws org.apache.axis2.AxisFault
     */
    public void init(ConfigurationContext confContext, TransportOutDescription transportOut)
            throws AxisFault;

    public void stop();
}
