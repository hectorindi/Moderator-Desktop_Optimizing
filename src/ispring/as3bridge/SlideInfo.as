﻿/*******************************************************************************
 * Copyright (c) iSpring Solutions, Inc. 
 * All rights reserved. This source code and the accompanying materials are made
 * available under the terms of the iSpring Public License v1.0 which accompanies
 * this distribution, and is available at:
 * http://www.ispringsolutions.com/legal/public-license-v10.html
 *
 *******************************************************************************/

package ispring.as3bridge
{
	import flash.events.EventDispatcher;
	
	public class SlideInfo extends EventDispatcher
	{
		private var m_bridgeConnector:BridgeConnector;
		
		private var m_slideIndex:Number;
		
		private var m_title:String;
		private var m_duration:Number;
		private var m_notesText:String;
		private var m_startTime:Number;
		private var m_endTime:Number;
		private var m_startStepIndex:Number;
		private var m_endStepIndex:Number;
		private var m_slideText:String;
		private var m_notesTextNormalized:String;
		private var m_titleNormalized:String;
		private var m_level:Number;
		
		private var m_animationSteps:AnimationSteps;
		
		private var m_metadataLoaded:Boolean = false;
		
		private var m_isLoaded:Boolean = false;
		
		private var m_hidden:Boolean;
		private var m_visibleIndex:Number;
		private var m_visibleStartTime:Number;
		private var m_visibleEndTime:Number;
		private var m_visibleStartStepIndex:Number;
		private var m_visibleEndStepIndex:Number;
		private var m_presenterIndex:Number;
		
		public function SlideInfo(internalClass:InternalClass, bridgeConnector:BridgeConnector, slideIndex:Number, slideInfo:Object)
		{
			m_bridgeConnector = bridgeConnector;
			m_slideIndex = slideIndex;
			m_startTime = slideInfo.startTime;
			
			m_visibleIndex = slideInfo.visibleIndex;
			m_visibleStartTime = slideInfo.visibleStartTime;
		}
		
		public function get animationSteps():AnimationSteps
		{
			return m_animationSteps;
		}
		
		public function loadMetadata(handler:Function):Boolean
		{
			if (m_metadataLoaded)
			{
				return false;
			}
			
			m_bridgeConnector.sendCommand("loadSlideMetadata", m_slideIndex);
			addEventListener(BridgeEvent.SLIDE_METADATA_LOAD, handler, false, 0, true);
			return true;
		}
		
		public function get isLoaded():Boolean
		{
			return m_isLoaded;
		}
		
		public function get metadataLoaded():Boolean
		{
			return m_metadataLoaded;
		}
		
		public function get title():String
		{
			return m_title;
		}
		
		public function get duration():Number
		{
			return m_duration;
		}
		
		public function get notesText():String
		{
			return m_notesText;
		}
		
		public function get startTime():Number
		{
			return m_startTime;
		}
		
		public function get endTime():Number
		{
			return m_endTime;
		}
		
		public function get startStepIndex():Number
		{
			return m_startStepIndex;
		}
		
		public function get endStepIndex():Number
		{
			return m_endStepIndex;
		}
		
		public function get slideText():String
		{
			return m_slideText;
		}
		
		public function get notesTextNormalized():String
		{
			return m_notesTextNormalized;
		}
		
		public function get titleNormalized():String
		{
			return m_titleNormalized;
		}
		
		public function get level():Number
		{
			return m_level;
		}
		
		public function setMetadata(internalClass:InternalClass, slideInfo:Object):void
		{
			m_title					= slideInfo.title;
			m_duration				= slideInfo.duration;
			m_notesText				= slideInfo.notesText;
			m_endTime				= slideInfo.endTime;
			m_startStepIndex		= slideInfo.startStepIndex;
			m_endStepIndex			= slideInfo.endStepIndex;
			m_slideText				= slideInfo.slideText;
			m_notesTextNormalized	= slideInfo.notesTextNormalized;
			m_titleNormalized		= slideInfo.titleNormalized;
			m_level					= slideInfo.level;
			
			m_hidden 				= slideInfo.hidden;
			m_visibleEndTime		= slideInfo.visibleEndTime;
			m_visibleStartStepIndex	= slideInfo.visibleStartStepIndex;
			m_visibleEndStepIndex	= slideInfo.visibleEndStepIndex;
			m_presenterIndex		= slideInfo.presenterIndex;
		
			m_animationSteps = new AnimationSteps(new InternalClass(), slideInfo.animationSteps);
			
			m_metadataLoaded = true;
			
			var e:BridgeEvent = new BridgeEvent(BridgeEvent.SLIDE_METADATA_LOAD);
			e.slideIndex = m_slideIndex;
			e.slideInfo = this;
			dispatchEvent(e);
		}
		
		public function loadingComplete(internalClass:InternalClass):void
		{
			m_isLoaded = true;
		}
		
		public function isHidden():Boolean
		{
			return m_hidden;
		}
		
		public function get index():Number
		{
			return m_slideIndex;
		}
		
		public function get visibleIndex():Number
		{
			return m_visibleIndex;
		}

		public function get visibleStartTime():Number
		{
			return m_visibleStartTime;
		}
		
		public function get visibleEndTime():Number
		{
			return m_visibleEndTime;
		}
		
		public function get visibleStartStepIndex():Number
		{
			return m_visibleStartStepIndex;
		}
		
		public function get visibleEndStepIndex():Number
		{
			return m_visibleEndStepIndex;
		}
	}
}