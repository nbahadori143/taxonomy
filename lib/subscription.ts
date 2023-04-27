// @ts-nocheck
// TODO: Fix this when we turn strict mode on.
import { UserSubscriptionPlan } from "types"
import { freePlan, proPlan } from "@/config/subscriptions"

export async function getUserSubscriptionPlan(
  userId: string
): Promise<UserSubscriptionPlan> {

  // Check if user is on a pro plan.
  const isPro =
    user.stripePriceId &&
    user.stripeCurrentPeriodEnd?.getTime() + 86_400_000 > Date.now()

  const plan = isPro ? proPlan : freePlan

  return {
    ...plan,
    ...user,
    stripeCurrentPeriodEnd: user.stripeCurrentPeriodEnd?.getTime(),
    isPro,
  }
}
