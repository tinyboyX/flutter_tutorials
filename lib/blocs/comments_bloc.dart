import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/events/comment_event.dart';
import 'package:flutter_tutorials/services/service.dart';
import 'package:flutter_tutorials/states/comments_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
   static const NUMBER_OF_COMMENTS_PER_PAGE = 20;

  //initial State
  CommentBloc() : super(CommentStateInitial());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is CommentFetchEvent &&
        !(state is CommentStateSuccess &&
            (state as CommentStateSuccess).hasReachedEnd)) {
      try {
        //Check if "has reached end of a page"
        if (state is CommentStateInitial) {
          //first time loading page
          //1.get comments from API
          //2.yield CommentStateSuccess
          final comments =
              await getCommentsFromApi(0, NUMBER_OF_COMMENTS_PER_PAGE);
          yield CommentStateSuccess(comments: comments, hasReachedEnd: false);
        } else if (state is CommentStateSuccess) {
          //load next page
          //if "next page is empty" => yield "CommentStateSuccess" with hasReachedEnd = true
          final currentState = state as CommentStateSuccess;
          int finalIndexOfCurrentPage = currentState.comments.length;
          final comments = await getCommentsFromApi(
              finalIndexOfCurrentPage, NUMBER_OF_COMMENTS_PER_PAGE);
          if (comments.isEmpty) {
            //change current state !
            yield currentState.cloneWith(hasReachedEnd: true);
          } else {
            //not empty, means "not reached end",
            yield CommentStateSuccess(
                comments: currentState.comments + comments, //merge 2 arrays
                hasReachedEnd: false);
          }
        }
      } catch (exception) {
        yield CommentStateFailure();
      }
    }
  }
}
