import SwiftUI

enum WidgetDemoStyle {
    case flat
    case glass
    case neobrutalism
    case neumorphism
    case skeuomorphism

    var seedTitle: String {
        switch self {
        case .flat: "Flat task"
        case .glass: "Glass task"
        case .neobrutalism: "Neo task"
        case .neumorphism: "Neumorphism task"
        case .skeuomorphism: "Skeuo task"
        }
    }

    var textColor: Color {
        switch self {
        case .glass:
            .white.opacity(0.9)
        case .flat, .neobrutalism:
            .black
        case .neumorphism, .skeuomorphism:
            .black.opacity(0.7)
        }
    }

    var mutedColor: Color {
        switch self {
        case .glass:
            .white.opacity(0.55)
        case .flat, .neobrutalism:
            .black.opacity(0.35)
        case .neumorphism, .skeuomorphism:
            .black.opacity(0.35)
        }
    }

    var tint: Color {
        switch self {
        case .flat: .blue
        case .glass: .white.opacity(0.9)
        case .neobrutalism: .black
        case .neumorphism: .cyan
        case .skeuomorphism: .gray
        }
    }

    var controlWeight: Font.Weight {
        self == .neobrutalism ? .black : .semibold
    }

    var checkmarkIcon: String {
        self == .neobrutalism ? "checkmark.square.fill" : "checkmark.circle.fill"
    }

    var emptyCheckmarkIcon: String {
        self == .neobrutalism ? "square" : "circle"
    }
}

struct StyleWidgetDemo: View {
    let style: WidgetDemoStyle

    @State private var isLoved = false
    @State private var isStarred = false
    @State private var isOn = true
    @State private var newTodo = ""
    @State private var volume = 0.6
    @State private var todos: [WidgetTodo]

    init(style: WidgetDemoStyle) {
        self.style = style
        _todos = State(initialValue: [
            WidgetTodo(title: style.seedTitle, isDone: false),
            WidgetTodo(title: "Another one", isDone: true),
        ])
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Spacer()
                StylePickerMenu()
            }

            HStack(spacing: 12) {
                card(role: .love) {
                    iconButton(
                        isActive: isLoved,
                        activeIcon: "heart.fill",
                        inactiveIcon: "heart",
                        activeColor: .red
                    ) {
                        isLoved.toggle()
                    }
                }

                card(role: .star) {
                    iconButton(
                        isActive: isStarred,
                        activeIcon: "star.fill",
                        inactiveIcon: "star",
                        activeColor: .yellow
                    ) {
                        isStarred.toggle()
                    }
                }
            }

            card {
                Toggle("Toggle", isOn: $isOn)
                    .toggleStyle(.switch)
                    .tint(style.tint)
                    .font(.system(size: 13, weight: style == .neobrutalism ? .bold : .medium))
                    .foregroundStyle(style.textColor)
                    .padding(.horizontal, 8)
            }

            card(height: 118) {
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        TextField("New todo...", text: $newTodo)
                            .textFieldStyle(.plain)
                            .font(.system(size: 13, weight: style == .neobrutalism ? .medium : .regular))
                            .foregroundStyle(style.textColor)

                        Button("Add", action: addTodo)
                            .buttonStyle(.plain)
                            .font(.system(size: 13, weight: style == .neobrutalism ? .bold : .medium))
                            .foregroundStyle(style.textColor)
                    }
                    .padding(.horizontal, 10)

                    VStack(alignment: .leading, spacing: 6) {
                        ForEach($todos) { $todo in
                            Button {
                                todo.isDone.toggle()
                            } label: {
                                HStack(spacing: 8) {
                                    Image(systemName: todo.isDone ? style.checkmarkIcon : style.emptyCheckmarkIcon)
                                        .foregroundStyle(todo.isDone ? doneColor : style.mutedColor)

                                    Text(todo.title)
                                        .strikethrough(todo.isDone)
                                        .foregroundStyle(todoTextColor(isDone: todo.isDone))

                                    Spacer()
                                }
                                .font(.system(size: 13, weight: style == .neobrutalism ? .medium : .regular))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 8)
                }
            }

            card(role: .slider) {
                HStack(spacing: 10) {
                    Image(systemName: "speaker.fill")
                        .foregroundStyle(style == .neobrutalism ? .black : style.textColor.opacity(0.8))

                    Slider(value: $volume, in: 0...1)
                        .tint(style.tint)

                    Image(systemName: "speaker.wave.3.fill")
                        .foregroundStyle(style == .neobrutalism ? .black : style.textColor.opacity(0.8))
                }
                .padding(.horizontal, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var doneColor: Color {
        style == .neobrutalism ? .black : .green
    }

    private func todoTextColor(isDone: Bool) -> Color {
        switch style {
        case .glass:
            return .white.opacity(isDone ? 0.45 : 0.9)
        case .flat:
            return .black.opacity(isDone ? 0.35 : 1.0)
        case .neobrutalism:
            return .black.opacity(isDone ? 0.35 : 1.0)
        case .neumorphism, .skeuomorphism:
            return .black.opacity(isDone ? 0.35 : 0.7)
        }
    }

    private func addTodo() {
        let trimmed = newTodo.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.isEmpty == false else { return }
        todos.insert(WidgetTodo(title: trimmed, isDone: false), at: 0)
        newTodo = ""
    }

    @ViewBuilder
    private func iconButton(
        isActive: Bool,
        activeIcon: String,
        inactiveIcon: String,
        activeColor: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Image(systemName: isActive ? activeIcon : inactiveIcon)
                .font(.system(size: 18, weight: style.controlWeight))
                .foregroundStyle(iconColor(isActive: isActive, activeColor: activeColor))
                .frame(width: 44, height: 34)
        }
        .buttonStyle(.plain)
    }

    private func iconColor(isActive: Bool, activeColor: Color) -> Color {
        if style == .neobrutalism { return .black }
        return isActive ? activeColor : style.textColor
    }

    @ViewBuilder
    private func card<Content: View>(
        height: CGFloat = 44,
        role: WidgetCardRole = .plain,
        @ViewBuilder content: () -> Content
    ) -> some View {
        ZStack {
            cardBackground(role: role)
            content()
        }
        .frame(height: height)
    }

    @ViewBuilder
    private func cardBackground(role: WidgetCardRole) -> some View {
        switch style {
        case .flat:
            Rectangle()
                .fill(Color.white)
                .overlay(Rectangle().stroke(Color.black.opacity(0.15), lineWidth: 1))

        case .glass:
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.1))
                .background(
                    BlurView(style: .systemUltraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.35), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 6)

        case .neobrutalism:
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.black)
                    .offset(x: 6, y: 6)

                RoundedRectangle(cornerRadius: 4)
                    .fill(role.neobrutalistFill)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.black, lineWidth: 2)
                    )
            }

        case .neumorphism:
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: .white.opacity(0.7), radius: 8, x: -6, y: -6)
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 6)

                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.shadow(.inner(color: .gray.opacity(0.25), radius: 2, x: 0, y: 1)))
            }

        case .skeuomorphism:
            RoundedRectangle(cornerRadius: 6)
                .stroke(
                    LinearGradient(
                        colors: [Color(white: 0.6), Color(white: 0.95)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1
                )
                .fill(Color.gray.opacity(0.15).shadow(.inner(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)))
                .shadow(color: Color.white.opacity(0.6), radius: 4, x: 0, y: -10)
                .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 6)
        }
    }
}

private enum WidgetCardRole {
    case plain
    case love
    case star
    case slider

    var neobrutalistFill: Color {
        switch self {
        case .love, .slider:
            .retroPink
        case .star:
            .retroYellow
        case .plain:
            .white
        }
    }
}

private struct WidgetTodo: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool
}
