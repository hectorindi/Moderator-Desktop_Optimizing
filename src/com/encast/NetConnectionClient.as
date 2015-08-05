/*
* Copyright (c) 2011 Solid Thinking Interactive All rights reserved.
* Redistribution and use in source and binary forms, with or without modification are not permitted
* Contact Solid Thinking Interactive for more information on licensing 
* http://www.solid-thinking.com
* http://www.fmsguru.com
*
************* 
THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND 
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SOLID THINKING
INTERACTIVE OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
DAMAGE.
*************
* 
* Basic Private Chat version 4.3 for Wowza
* 10/2011
* Solid Thinking Interactive
* FMSGuru.com
* 
*/

package com.encast{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	
	import events.LoginEvent;
	
	import valueObjects.User;
	
	public class NetConnectionClient extends EventDispatcher{
		
		public static const ON_USERID:String = "onSetUserID";
		public static const ON_RECEIVE_INVITE:String = "onReceiveInvite";
		public static const ON_ACCEPT_INVITE:String = "onAcceptInvite";
		public static const ON_DENY_INVITE:String = "onDenyInvite";
		public static const ON_CANCEL_INVITE:String = "onCancelInvite";
		public static const ON_INVITED_USER_LOGOFF:String = "onInvitedUserLogoff";
		public static const ON_KICKED:String = "onKicked";
		public static const ON_BANNED:String = "onBanned";
		public static const ON_BANNED_USERS_LIST:String = "onBannedUsersList";
		public static const ON_CLOSE_PRIVATE_CHAT:String = "onClosePrivateChat";
		public static const ON_PRIVATE_CHAT:String = "onPrivateChat";
		public static const ON_REFRESH_USERS:String = "onUserRefresh";
		public static const ON_SEND_INVITE:String = "On_Send_Invite";
		public static const ON_MOVE_USER_TO_SHOW:String = "onMoveUserToShow";
		public static const ON_MOVE_USER_TO_GREEN_ROOM:String = "onMoveUSerToGreenRoom";
		public static const ON_MOVE_USER_TO_SHOW_REPLY:String = "onMoveUserToShowReply";
		public static const ON_START_PRIVATE_VID_CHAT:String = "onStartPrivateVidChat";
		public static const ON_CLOSE_PRIVATE_VID_CHAT:String = "onClosePrivateVidChat";
		public static const ON_SHOW_POLL:String = "onShowPoll";
		public static const ON_SHOW_POLL_ANS:String = "onShowPollAns";
		public static const ON_UPDATE_USER:String = "onUpdateUser";
		public static const ON_REMOVE_USER:String = "onRemoveUser";
		
		private var _uID:Number;
		private var _userName:String;
		private var _roleSelected:String;
		
		
		private var _privateRoomName:String;
		
		public function NetConnectionClient(target:IEventDispatcher=null){
			super(target);
		}
		
		public function confirmConnection():String{
			return "confirmed";
		}
		
		protected function loginPanel_loginHandler(event:LoginEvent):void{
			_roleSelected=event.roleSelected;
		
		}
		
		//public function setUserID(uID:Number, userName:String , isPresenter:Boolean, chatHistory:Array):void{
		
		public function setUserID(userOBJ:Object,showUserArray:Array,chatHistory:Object):void{
			var user:User = new User();
			user.userId = userOBJ.userId;
			user.userName = userOBJ.userName;
			user.DOB = userOBJ.birthdate;
			user.provinceName = userOBJ.provinceName;
			user.emailId = userOBJ.emailId;
			user.city = userOBJ.city;
			user.ip = userOBJ.ip;
			user.userRole = userOBJ.userRole;
			user.onAir = userOBJ.ON_AIR;
			user.showID = userOBJ.showId;
			user.inPrivateChat = userOBJ.inPrivateChat;
			user.withUserID = userOBJ.withUserID;
			user.age = userOBJ.age;
			_uID = Number(user.userId);
			_userName = user.userName;	
			
			var tempObj:Object = new Object();
			
			tempObj.user = user;
			tempObj.showUserArray = showUserArray;
			
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_USERID, true, false, tempObj));
		}
		
		//BasicPrivateChat class listens for these events
		public function receiveInvite(fromUserName:String):void{
			var tempObj:Object = new Object();
			tempObj.invitingUserName = fromUserName;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_RECEIVE_INVITE, true, false, tempObj));
		}
		
		public function denyInvite(userId:String):void{
			var tempObj:Object = new Object();
			tempObj.userID = userId;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_DENY_INVITE, true, false, tempObj));
		}
		
		public function cancelInvite():void{
			dispatchEvent(new Event(NetConnectionClient.ON_CANCEL_INVITE));
		}
		
		public function acceptInvite(roomName:String):void{
			_privateRoomName = roomName;
			
			var tempObj:Object = new Object();
			tempObj.privateRoomName = roomName;
			
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_ACCEPT_INVITE, true, false, tempObj));
		}
		
		public function onInvitedUserLogoff():void{
			dispatchEvent(new Event(NetConnectionClient.ON_INVITED_USER_LOGOFF));
		}
		
		public function kicked():void{
			AppManager.getInstance().log("ckicking user")
			var tempObj:Object = new Object();
			tempObj.message = "You are being kicked out of the chat by the administrator";
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_KICKED, true, false, tempObj));
		}
		
		public function banned(msg:String):void{
			var tempObj:Object = new Object();
			tempObj.message = "You are being banned because : " + msg;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_BANNED, true, false, tempObj));
		}
		
		public function receiveBannedUsersList(bannedUsersList:Object):void{
			var tempObj:Object = new Object();
			tempObj.list = bannedUsersList;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_BANNED_USERS_LIST, true, false, tempObj));
		}
		

		public function closePrivateChat(info:Object):void
		{
			var tempObj:Object = new Object();
			tempObj.tocloseID = info;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_CLOSE_PRIVATE_CHAT, true, false, tempObj));
		}
		
		public function setprivateChat(info:Object):void
		{
			var tempObj:Object = new Object();
			tempObj = info;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_PRIVATE_CHAT, true, false, tempObj));
		}
		
		public function onUserRefresh(info:Object):void
		{
			var tempObj:Object = new Object();
			tempObj = info;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_REFRESH_USERS, true, false, tempObj));
		}
		
		public function onMoveUserToShow(userObj:Object,infoArray:Array,info:String):void
		{
			var tempObj:Object = new Object();
			tempObj.array = infoArray;
			tempObj.user = userObj;
			tempObj.reason = info;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_MOVE_USER_TO_SHOW_REPLY, true, false, tempObj));
			if(userObj.userId == AppManager.getInstance().userID)
			{
				var event:Event = new WowzaCustomEvent("userAddedToShow",true,true);
				dispatchEvent(event);
			}
			
			if(info == "Full")
			{
				Alert.show("The Show is Full","Notification")
			}
		}
		
		public function onMoveUserToGreenRoom(userObj:Object,infoArray:Array):void
		{
			//trace("removeUser onMoveUserToGreenRoom");
			var tempObj:Object = new Object();
			tempObj.array = infoArray;
			tempObj.user = userObj;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_MOVE_USER_TO_GREEN_ROOM, true, false, tempObj));
			if(userObj.userId == AppManager.getInstance().userID)
			{
				var event:Event = new WowzaCustomEvent("userRemoved",true,true);
				dispatchEvent(event);
			}
		}
		public function getUserID():Number{
			return _uID;
		}
		
		public function getUserName():String{
			return _userName;
		}
		
		public function getPrivateRoomName():String{
			return _privateRoomName;
		}
		
	
		public function close():void
		{
			AppManager.getInstance().log("Close called on client");
		}
		
		public function inkoveUserToPrivateChat():void
		{
			/*var tempObj:Object = new Object();
			tempObj.info = info;*/
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_START_PRIVATE_VID_CHAT, true, false, null));
		}
		
		public function closeVideoPrivateChat(info:Object,info2:Object):void
		{
			var tempObj:Object = new Object();
			tempObj.info = info;
			tempObj.info2 = info2;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_CLOSE_PRIVATE_VID_CHAT, true, false, tempObj));
		}
		
		public function setPollCients(info:Object):void
		{
			var tempObj:Object = new Object();
			tempObj.title = info.pollTitle;
			tempObj.question = info.pollQues;
			tempObj.pollId = info.pollId;
			tempObj.type = info.pollType;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_SHOW_POLL, true, false, tempObj));
		}
		
		public function setPollAnsCients(info:Object):void
		{
			var tempObj:Object = new Object();
			tempObj.title = info.pollTitle;
			tempObj.question = info.pollQues;
			tempObj.answer = info.answer;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_SHOW_POLL_ANS, true, false, tempObj));
		}
		
		public function UpdateViewUser(info:Object):void
		{
			var tempObj:Object = new Object();
			tempObj.info = info;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_UPDATE_USER, true, false, tempObj));
		}
		
		public function removeUser(info:Object,showArr:Array):void
		{
			trace("removeUser");
			var tempObj:Object = new Object();
			tempObj.info = info;
			//tempObj.user = info;
			tempObj.array = showArr;
			var oldArr:Array = AppManager.getInstance().ShowUserArray;
			//AppManager.getInstance().oldShowUserArray = oldArr;
			dispatchEvent(new WowzaCustomEvent(NetConnectionClient.ON_REMOVE_USER, true, false, tempObj));
		}
		
		public function onEnlargeVideo(userId:String,userName:String):void
		{
			var eveObj:Object = new Object();
			eveObj.id = userId;
			eveObj.name = userName;
			var eve:Event = new WowzaCustomEvent("enlargeVid",true,true,eveObj);
			dispatchEvent(eve);
		}
		
		public function setAutomaticShift(value:String):void
		{
			var eveObj:Object = new Object();
			eveObj.value = value;
			var eve:Event = new WowzaCustomEvent("setAutomaticShift",true,true,eveObj);
			dispatchEvent(eve);
		}
		
		public function enableAudio(userId:String,userName:String):void
		{
			
		}
		
		public function activateAutomaticShift():void
		{
			var eveObj:Object = new Object();
			var eve:Event = new WowzaCustomEvent("activateAutomaticShift",true,true,eveObj);
			dispatchEvent(eve);
		}
		
		public function activateReplyAutomaticShift():void
		{
			var eveObj:Object = new Object();
			var eve:Event = new WowzaCustomEvent("activateReplyAutomaticShift",true,true,eveObj);
			dispatchEvent(eve);
		}
		
		public function disablePoll(poll:Object):void
		{
			var eveObj:Object = new Object();
			eveObj.poll = poll;
			var eve:Event = new WowzaCustomEvent("onDisablePoll",true,true,eveObj);
			dispatchEvent(eve);
		}
		
	}
	
}