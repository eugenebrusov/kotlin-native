import cocoapods.AFNetworking.AFHTTPResponseSerializer
import cocoapods.AFNetworking.AFHTTPSessionManager
import platform.Foundation.*
import platform.UIKit.NSDocumentTypeDocumentAttribute
import platform.UIKit.NSHTMLTextDocumentType
import platform.UIKit.UITextView
import platform.UIKit.create
import kotlin.Any
import kotlin.String
import kotlin.to
import kotlin.toString

/**
 * Retrieves the content by the given URL and shows it at the given WebKitView
 */
fun getAndShow(url: String, callback: NetCallback) {
    val manager = AFHTTPSessionManager()
    manager.responseSerializer = AFHTTPResponseSerializer()
    val onSuccess = { _: NSURLSessionDataTask?, response: Any? ->
	val data = response as NSData
	val text = NSString.create(data, NSUTF8StringEncoding)!!
        callback.onSuccess(text)
    }
    val onError = { _: NSURLSessionDataTask?, error: NSError? ->
        NSLog("Cannot get ${url}.")
        NSLog(error.toString())
    }

    manager.GET(url, null, onSuccess, onError)
}