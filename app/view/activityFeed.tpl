<?php
	
	require_once '../controller/sessionAttributes.php';
	if (!isset($e_user)) {
		# Redirect as user is not logged in.
    	session_unset();
    	header('Location: '. SERVER_PATH. 'login/');
    	exit();
	}

?>
	
	<div class="userActivityFeed">
		<div>
			<h2 class="activityFeedPageHeader">Activity Feed</h2>
		</div>
		
		
		<?php
			/*
			 *TODO. Need to get all activities which correspond to the specific user.
			 *...Get the entire rows of the activity_log table which have a user_id or user_id2
			 *which corresponds to the user_id of "vivekb88", for example.
			 *
			 *What needs to be done: Provide the $activities array, which is accessed from the database.
			 *
			 **/
			
			//Some hardcode, for testing. ...
			//DELETE after database access is implemented.(Start)
			
			$activity1 = new Activity();
			$activity1->set('activity_type_id',3);
			$activity1->set('user_id_string','vivekb88');
			$activity1->set('date_modified_new','2014-10-21 18:53:33');
			$activity1->set('up_value_new','130');
			$activity1->set('up_date','2014-10-12');
			$activity1->set('r_name','West Virginia');
			$activity1->set('comment_new','This is so much fun!');
			
			$activity2 = new Activity();
			$activity2->set('activity_id',1);
			$activity2->set('u_id',1);
			$activity2->set('user_id_string','vivekb88');
			$activity2->set('activity_type_id',1);
			$activity2->set('date_modified_new','2014-11-09 13:29:28');
			$activity2->set('date_modified_old','2014-11-07 09:19:02');
			$activity2->set('first_name_new','Vivek');
			$activity2->set('first_name_old','Vive');
			$activity2->set('middle_name_new','Bharath');
			$activity2->set('middle_name_old','B');
			$activity2->set('last_name_new','Akupatni');
			$activity2->set('last_name_old','Ak.');
			
			$activity3 = new Activity();
			$activity3->set('activity_type_id',2);
			$activity3->set('user_id_string','vivekb88');
			$activity3->set('user_id2_string','jonatho7');
			$activity3->set('date_modified_new','2014-11-09 13:33:41');
			
			$activity4 = new Activity();
			$activity4->set('activity_type_id',2);
			$activity4->set('user_id_string','harshalh');
			$activity4->set('user_id2_string','vivekb88');
			$activity4->set('date_modified_new','2014-11-09 13:35:05');
			
			$activity5 = new Activity();
			$activity5->set('activity_type_id',4);
			$activity5->set('user_id_string','vivekb88');
			$activity5->set('date_modified_new','2014-11-09 13:48:47');
			$activity5->set('up_value_new','200');
			$activity5->set('up_date','2014-10-12');
			$activity5->set('r_name','West Virginia');
			$activity5->set('comment_new','I think this prediction will be more accurate, actually.');
			
			$activity6 = new Activity();
			$activity6->set('activity_type_id',5);
			$activity6->set('user_id_string','vivekb88');
			$activity6->set('date_modified_new','2014-11-09 13:51:55');
			$activity6->set('up_date','2014-10-12');
			$activity6->set('r_name','West Virginia');
			
			//The activities array.
			$activities = array($activity1, $activity2, $activity3, $activity4, $activity5, $activity6);
			//DELETE after database access is implemented.(End)
			
			//Max number of activity feed items to show.
			$max_activity_feed = 20;
			
			//iterate over the activity feed.
			for($index = 0; $index < count($activities) && $index < $max_activity_feed; $index++){
				$activity = $activities[$index];
				
				if ($activity->get('activity_type_id') == 1){
					echo '<div class="activityFeedDiv">';
						$newName = $activity->get('first_name_new') . " " . $activity->get('middle_name_new') . " " . $activity->get('last_name_new');
						echo "<p class='activityFeedParag'><a href='SERVER_PATH . 'users/' . {$activity->get('user_id_string')}'>{$activity->get('user_id_string')}</a> changed their name to {$newName}</p>";
						echo "<p class='activityFeedParag activityFeedDate'>{$activity->getDate_Modified_New()}</p>";
					echo '</div>';
				}
				
				if ($activity->get('activity_type_id') == 2){
					echo '<div class="activityFeedDiv">';
						$newName = $activity->get('first_name_new') . " " . $activity->get('middle_name_new') . " " . $activity->get('last_name_new');
						echo "<p class='activityFeedParag'><a href='SERVER_PATH . 'users/' . {$activity->get('user_id_string')}'>{$activity->get('user_id_string')}</a> is now following <a href='SERVER_PATH . 'users/' . {$activity->get('user_id2_string')}'>{$activity->get('user_id2_string')}</a></p>";
						echo "<p class='activityFeedParag activityFeedDate'>{$activity->getDate_Modified_New()}</p>";
					echo '</div>';
				}
				
				if ($activity->get('activity_type_id') == 3){
					echo '<div class="activityFeedDiv">';
						echo "<p class='activityFeedParag'><a href='SERVER_PATH . 'users/' . {$activity->get('user_id_string')}'>{$activity->get('user_id_string')}</a> made a new prediction for {$activity->get('r_name')} for {$activity->get('up_date')}.</p>";
						echo "<p class='activityFeedParag activityFeedDate'>{$activity->getDate_Modified_New()}</p>";
						echo "<p class='activityFeedComment'><strong>\"{$activity->get('comment_new')}\"</strong></p>";
					echo '</div>';
				}
				
				if ($activity->get('activity_type_id') == 4){
					echo '<div class="activityFeedDiv">';
						echo "<p class='activityFeedParag'><a href='SERVER_PATH . 'users/' . {$activity->get('user_id_string')}'>{$activity->get('user_id_string')}</a> modified their prediction for {$activity->get('r_name')} for {$activity->get('up_date')}.</p>";
						echo "<p class='activityFeedParag activityFeedDate'>{$activity->getDate_Modified_New()}</p>";
						echo "<p class='activityFeedComment'><strong>\"{$activity->get('comment_new')}\"</strong></p>";
					echo '</div>';
				}
				
				if ($activity->get('activity_type_id') == 5){
					echo '<div class="activityFeedDiv">';
						echo "<p class='activityFeedParag'><a href='SERVER_PATH . 'users/' . {$activity->get('user_id_string')}'>{$activity->get('user_id_string')}</a> deleted their prediction for {$activity->get('r_name')} for {$activity->get('up_date')}.</p>";
						echo "<p class='activityFeedParag activityFeedDate'>{$activity->getDate_Modified_New()}</p>";
					echo '</div>';
				}
			}
		?>
		
		<!--
		<div>
			<p><strong>Hard code examples, which correllate to the activity_log table in mysql...Will make more dynamic soon.</strong></p>
			<p>vivekb88 changed their name to Vivek Bharath Akupatni</p>
			<p>vivekb88 is now following jonatho7</p>
			<p>harshalh is now following vivekb88</p>
			<p>vivekb88 made a new prediction for West Virginia for 2014-10-12. "This is so much fun!"</p>
			<p>vivekb88 modified their prediction for West Virginia for 2014-10-12. "I think this prediction will be more accurate, actually."</p>
			<p>vivekb88 deleted their prediction for West Virginia for 2014-10-29."</p>
		</div>
		-->
		
	</div>
	
</div>






