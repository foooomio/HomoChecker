<homo-anime class={ state }>
    <i class="fa-solid fa-mars part-passive"></i>
    <i class="fa-solid fa-mars part-active" onanimationend={ trigger.bind(this, "animationend") }></i>
    <style type="text/dart-sass">
        homo-anime {
            display: inline-block;
            margin-right: -15px;
            margin-left: -3px;
            min-width: 35px;
            transform: translate(0px, -5px);

            @media (max-width: 767px) {
                transform: translate(0px, -3px);
            }

            .fa-mars {
                color: white;
                display: inline-block;
                padding: 0 0.1em;
            }

            .part-active {
                position: relative;
                top: 0.6em;
                left: -1.775em;
            }

            &.start {
                @keyframes active-start {
                    25% {
                        transform: rotate(15grad);
                    }

                    75% {
                        transform: rotate(-15grad);
                    }
                }

                .part-active {
                    animation: active-start .5s 8 cubic-bezier(.05, .44, .95, .55);
                }
            }

            &.pako {
                @keyframes passive-pako {
                    25% {
                        transform: translate(1px, -1.33px);
                    }

                    75% {
                        transform: translate(0px, 0px);
                    }
                }

                @keyframes active-pako {
                    25% {
                        transform: translate(3px, -4px);
                    }

                    75% {
                        transform: translate(-5px, 4px);
                    }
                }

                .part-passive {
                    animation: passive-pako .6s 25 cubic-bezier(.05, .44, .95, .55);
                }

                .part-active {
                    animation: active-pako .6s 25 cubic-bezier(.05, .44, .95, .55);
                }

            }

            &.finish {
                @keyframes passive-finish {
                    0% {
                        transform: translate(0px, 0px);
                    }

                    100% {
                        transform: translate(1px, -1.33px);
                    }
                }

                @keyframes active-finish {
                    0% {
                        transform: translate(1px, -1.33px);
                    }

                    100% {
                        transform: translate(3px, -4px);
                    }
                }

                .part-passive {
                    animation: passive-finish .5s 7 alternate;
                }

                .part-active {
                    animation: active-finish .5s 7 alternate;
                }

            }

            &.dopyulicated {
                @keyframes active-dopyulicated {
                    0% {
                        transform: translate(3px, -4px);
                    }

                    100% {
                        transform: translate(3px, -4px) scale(1.1, 1.1);
                    }
                }

                .part-passive {
                    transform: translate(1px, -1.33px);
                }

                .part-active {
                    animation: active-dopyulicated .5s 8 alternate;
                }
            }

            &.end {
                @keyframes passive-end {
                    0% {
                        transform: translate(1px, -1.33px);
                    }

                    100% {
                        transform: translate(0px, 0px);
                    }
                }

                @keyframes active-end {
                    0% {
                        transform: translate(3px, -4px);
                    }

                    100% {
                        transform: translate(0px, 0px);
                    }
                }

                .part-passive {
                    animation: passive-end 5s linear;
                }

                .part-active {
                    animation: active-end 5s linear;
                }
            }

            &.void {
                @keyframes active-void {
                    0% {
                        opacity: 1;
                    }
                }

                .part-active {
                    animation: active-void 5s;
                }
            }
        }
    </style>
    <script>
        import { merge, from, fromEvent, zip } from "rxjs";
        import { repeat } from "rxjs/operators";

        zip(
            merge(
                fromEvent(this, "mount"),
                fromEvent(this, "animationend"),
            ),
            from([
                "start",
                "pako",
                "finish",
                "dopyulicated",
                "end",
                "void",
            ]),
        ).pipe(
            repeat(),
        ).subscribe(([ e, state ]) => {
            this.update({ state });
        });
    </script>
</homo-anime>
