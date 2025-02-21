import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboard_er/src/presentation/widgets/page_indicator.dart';
import '../../application/bloc/onboard_bloc.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';

class BottomNavigation extends StatelessWidget {
  final OnboardState state;
  final VoidCallback onCompleted;
  final Color btnColor ;

  const BottomNavigation({
    super.key,
    required this.state,
    required this.onCompleted,
   required  this.btnColor ,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          PageIndicator(state: state),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (state.pageIndex > 0) ?
                _buildButton( 
              btnColor: btnColor,
                  icon: Icons.arrow_back,
                  onTap: () => context.read<OnboardBloc>().add(PreviousPageEvent()), // ✅ Triggers event
                ) : SizedBox(height: 55,width: 55),
              _buildButton(
       btnColor: btnColor,
                icon: state.pageIndex == state.pages.length - 1 ? Icons.check : Icons.arrow_forward,
                onTap: () {
                  if (state.pageIndex < state.pages.length - 1) {
                    context.read<OnboardBloc>().add(NextPageEvent()); // ✅ Moves to next page
                  } else {
                    onCompleted();
                  }
                },
                isFinalStep: state.pageIndex == state.pages.length - 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required IconData icon, required VoidCallback onTap, bool isFinalStep = false,  Color btnColor = Colors.blue,}) {
    return InkWell(
      onTap: onTap,
      child: ClayContainer(
        curveType: CurveType.concave,
        width: 55,
        height: 55,
        depth: 80,
        spread: 1,
        borderRadius: 30,
        color: isFinalStep ? Colors.green : btnColor,
        child: Icon(icon, color: isFinalStep ? Colors.white : null),
      ),
    );
  }
}