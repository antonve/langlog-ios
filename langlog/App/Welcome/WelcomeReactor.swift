import ReactorKit
import RxSwift

class WelcomeReactor: Reactor {
    enum Action {}

    enum Mutation {}

    struct State {}

    let initialState = State()

    init() {}

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {}
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {}
        return state
    }
}
