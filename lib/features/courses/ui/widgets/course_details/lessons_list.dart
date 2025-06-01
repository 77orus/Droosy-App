import 'package:flutter/material.dart';

class LessonsList extends StatelessWidget {
  final bool isUnlocked;
  final VoidCallback? onTap;
  const LessonsList({super.key, required this.isUnlocked, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: isUnlocked ? 10 : 0,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return LessonTile(
          title: "Lesson ${index + 1}",
          duration: "00:00:00",
          isCompleted: false,
          isLocked: true,
          isUnlocked: true,
        );
      },
    );
  }
}

class LessonTile extends StatelessWidget {
  final String title;
  final String duration;
  final bool isCompleted;
  final bool isLocked;
  final bool isUnlocked;
  final VoidCallback? onTap;
  const LessonTile({
    super.key,
    required this.title,
    required this.duration,
    required this.isCompleted,
    required this.isLocked,
    required this.isUnlocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor:
            isCompleted
                ? theme.colorScheme.primary
                : isLocked
                ? theme.colorScheme.secondary.withOpacity(0.1)
                : theme.colorScheme.secondary.withOpacity(0.2),
        child: Icon(
          isCompleted
              ? Icons.check
              : isLocked
              ? Icons.lock
              : Icons.play_arrow,
          color:
              isCompleted
                  ? theme.colorScheme.primary
                  : isLocked
                  ? theme.colorScheme.secondary
                  : theme.colorScheme.secondary,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: isLocked ? theme.colorScheme.secondary : null,
        ),
      ),
      subtitle: Text(
        duration,
        style: theme.textTheme.bodySmall?.copyWith(
          color: isLocked ? theme.colorScheme.secondary : null,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
