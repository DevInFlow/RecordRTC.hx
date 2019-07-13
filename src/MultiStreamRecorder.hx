import haxe.extern.EitherType;
import js.html.Blob;
import js.html.MediaStreamTrack;
import js.html.MediaStream;

@:enum
abstract MimeType(String) from String to String {
	var VideoWebM = 'video/webm; codecs="vp8, opus"';
	var VideoMP4 = 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"';
}

//TODO implement Mixer object
typedef Mixer = Dynamic;

typedef Options = {
	?elementClass:String,
	?disableLogs:Bool,
	?frameInterval:Int,
	?mimeType:MimeType,
	?video:{
		?width:Float,
		?height:Float
	}
}

@:native("MultiStreamRecorder")
extern class MultiStreamRecorder {
	public function new(?arrayOfMediaStreams:Array<MediaStream>, ?options:Options):Void;
	public function record():Void;
	public function pause():Void;
	public function resume():Void;
	public function clearRecordedData():Void;
	public function getAllVideoTracks():Array<MediaStreamTrack>;
	public function stop(callback:Blob->Void):Array<MediaStreamTrack>;
	public function addStreams(streams:EitherType<MediaStream,Array<MediaStream>>):Void;
	public function resetVideoStreams(streams:EitherType<MediaStream,Array<MediaStream>>):Void;
	public function getMixer():Mixer;
}
