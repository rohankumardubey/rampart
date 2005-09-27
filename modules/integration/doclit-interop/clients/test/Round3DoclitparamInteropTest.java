package test;

import junit.framework.TestCase;
import java.rmi.RemoteException;
import test.stub.databinding.org.soapinterop.*;
import test.stub.WSDLInteropTestDocLitPortTypeStub;


/**
 * Created by IntelliJ IDEA.
 * User: Gayan
 * Date: Sep 16, 2005
 * Time: 9:29:53 AM
 * To change this template use File | Settings | File Templates.
 */
public class Round3DoclitparamInteropTest extends TestCase{

    WSDLInteropTestDocLitPortTypeStub stub = null;
    EchoStringDocument strParaDoc = null;
    EchoStringDocument.EchoString echoStr = null;
    String str = "Gayan Asanka";
    EchoStringResponseDocument retStrDoc = null;
    EchoStringArrayDocument strArrayParaDoc = null;
    EchoStringArrayDocument.EchoStringArray echoStrArray = null;
    ArrayOfstringLiteral strLitArr = null;
    EchoStringArrayResponseDocument retArrayDoc = null;
    String[] strArry = {"String 1", "String 2", "String 3"};
    ArrayOfstringLiteral retArray = null;
    EchoStructDocument structParaDoc = null;
    SOAPStruct soapStruct = null;
    float flt = (float)1234.456;
    int i = 123456;
    EchoStructDocument.EchoStruct echoStruct = null;
    EchoStructResponseDocument retStructDoc = null;
    SOAPStruct retStruct = null;
    EchoVoidDocument.EchoVoid echoVoid = null;
    EchoVoidDocument echVoidDoc = null;
    EchoVoidResponseDocument echoVoidResDoc=null;

    public void setUp() throws Exception {
        stub = new WSDLInteropTestDocLitPortTypeStub();
    }

    public void testEchoString() throws RemoteException {
        echoStr= EchoStringDocument.EchoString.Factory.newInstance();
        echoStr.setParam0(str);
        strParaDoc = EchoStringDocument.Factory.newInstance();
        strParaDoc.setEchoString(echoStr);
        retStrDoc = stub.echoString(strParaDoc);
        assertEquals(str,retStrDoc.getEchoStringResponse().getReturn());
    }

    public void testEchoStringArray() throws RemoteException {
        strLitArr = ArrayOfstringLiteral.Factory.newInstance();
        strLitArr.setStringArray(strArry);
        echoStrArray = EchoStringArrayDocument.EchoStringArray.Factory.newInstance();
        echoStrArray.setParam0(strLitArr);
        strArrayParaDoc = EchoStringArrayDocument.Factory.newInstance();
        strArrayParaDoc.setEchoStringArray1(echoStrArray);
        retArrayDoc = stub.echoStringArray(strArrayParaDoc);
        retArray=retArrayDoc.getEchoStringArrayResponse().getReturn();
        assertEquals(strArry[0],retArray.getStringArray()[0]);
        assertEquals(strArry[1],retArray.getStringArray()[1]);
        assertEquals(strArry[2],retArray.getStringArray()[2]);
    }

    public void testEchoStruct() throws RemoteException {
        soapStruct = SOAPStruct.Factory.newInstance();
        soapStruct.setVarFloat(flt);
        soapStruct.setVarInt(i);
        soapStruct.setVarString(str);
        echoStruct = EchoStructDocument.EchoStruct.Factory.newInstance();
        echoStruct.setParam0(soapStruct);
        structParaDoc = EchoStructDocument.Factory.newInstance();
        structParaDoc.setEchoStruct(echoStruct);
        retStructDoc = stub.echoStruct(structParaDoc);
        retStruct = retStructDoc.addNewEchoStructResponse().getReturn();
        assertEquals(flt,retStruct.getVarFloat(),0);
        assertEquals(i,retStruct.getVarInt());
        assertEquals(str,retStruct.getVarString());

    }

    public void testEchoVoid() throws RemoteException {

        echoVoid = EchoVoidDocument.EchoVoid.Factory.newInstance();
        echVoidDoc = EchoVoidDocument.Factory.newInstance();
        echVoidDoc.setEchoVoid(echoVoid);
        echoVoidResDoc = stub.echoVoid(echVoidDoc);
    }
}
